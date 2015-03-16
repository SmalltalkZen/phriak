testing
testNoSiblingsLastWriteWins
	"Test to make sure that siblings (multiple versions) are NOT created when multiple writes are made to the same key without
		first fetching the causal context to a bucket where siblings are disabled."

	| bucket testKey object |
	"Set the property 'allow_mult' to false first on the bucket.
	See http://docs.basho.com/riak/latest/theory/concepts/Vector-Clocks/"
	bucket := self bucketNoSiblings.
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