testing
testSiblingsOnStore
	"Test to make sure that siblings (multiple versions) are created when multiple writes are made to the same key without first fetching the causal context. Requires a bucket with siblings enabled in the properties via 'allow_mult'."

	| bucket testKey object  |
	"This is a RiakAllowMultBucket instance"
	bucket := self bucketForTesting.
	"Bucket properties should only be configured once. However, for practical testing purposes,
		we are forced to call storeProperties, since this bucket is unlikely to have been already set
		up via whole-cluster config."
	bucket properties at: 'allow_mult' put: true.
	bucket storeProperties.	"Wait for the settings to be propagated around the cluster"
	(Delay forSeconds: 2) wait.
	
	testKey := 'test-siblings-on-store'.
	"First write "
	object := bucket newObject
		key: testKey;
		data: 'value1';
		yourself.
	object store.
	self assert: object context isNil not.
	self deny: object hasConflicts.
	
	"Second write should create siblings"
	object := bucket newObject
		key: testKey;
		data: 'value2';
		yourself.
	self assert: object context isNil.
	self deny: object hasConflicts.
	object store.
	self assert: object context isNil not.
	self assert: object hasConflicts.
	self assert: object siblings size equals: 2.