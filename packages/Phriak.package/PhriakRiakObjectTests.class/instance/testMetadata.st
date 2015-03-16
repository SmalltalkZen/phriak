testing
testMetadata
	| bucket object testKey |
	bucket := self bucketForTesting.
	testKey := 'test-metadata'.
	object := bucket newObject
		key: testKey;
		data: 'abc';
		yourself.
	object metadata at: 'hello' put: 'world'.
	object store.
	self assert: ((bucket at: testKey) metadata at: 'hello') equals: 'world'