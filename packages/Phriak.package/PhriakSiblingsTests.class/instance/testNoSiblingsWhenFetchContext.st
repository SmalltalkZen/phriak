testing
testNoSiblingsWhenFetchContext
	"Test to make sure that siblings (multiple versions) are NOT created (in a bucket where siblings are enabled) when you make multiple writes to the same key."

	| bucket testKey object |
	"This is a RiakAllowMultBucket instance"
	bucket := self bucketForTesting.
	"Bucket properties should only be configured once. However, for practical testing purposes,
		we are forced to call storeProperties, since this bucket is unlikely to have been already set
		up via whole-cluster config."
	bucket properties at: 'allow_mult' put: true.
	bucket storeProperties.
	"Wait for the settings to be propagated around the cluster"
	(Delay forSeconds: 2) wait.
	
	testKey := 'test-no-siblings-fetch-context'.
	"Make the first write"
	bucket newObject
		key: testKey;
		data: '1';
		store.
	
	"Read-before-you-write for the next value"
	object := bucket at: testKey.
	object 
		data: '2';
		store.
		
	object := bucket at: testKey.
	object 
		data: '3';
		store.
	
	object := bucket at: testKey.
	self deny: object hasConflicts.	"No siblings"
	self assert: object data equals: '3'