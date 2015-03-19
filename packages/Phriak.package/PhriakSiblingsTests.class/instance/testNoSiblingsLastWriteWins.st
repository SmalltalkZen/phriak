testing
testNoSiblingsLastWriteWins
	"Test to make sure that siblings (multiple versions) are NOT created when multiple writes are made to the same key without
		first fetching the causal context to a bucket where siblings are disabled."

	| bucket testKey object |
	"This is a regular RiakBucket instance"
	bucket := self bucketNoSiblings.
	"Bucket properties should only be configured once. However, for practical testing purposes,
		we are forced to call storeProperties, since this bucket is unlikely to have been already set
		up via whole-cluster config."
	bucket properties at: 'allow_mult' put: false.
	bucket storeProperties.
	
	testKey := 'test-no-siblings-lww'.
	bucket newObject
		key: testKey;
		data: '1';
		store.
	bucket newObject
		key: testKey;
		data: '2';
		store.
	bucket newObject
		key: testKey;
		data: '3';
		store.
	object := bucket at: testKey.
	self deny: object hasConflicts.	"Last write wins"
	self assert: object data equals: '3'