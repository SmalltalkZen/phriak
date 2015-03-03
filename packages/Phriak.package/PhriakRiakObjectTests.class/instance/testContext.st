tests
testContext
	| bucket object aContext testKey |
	bucket := self bucketForTesting.
	testKey := 'test-context'.
	 bucket newObject
		key: testKey;
		data: 'abc';
		store.
	object := bucket at: testKey.
	aContext := object context.
	object store.
	self deny: (bucket at: testKey) context = aContext.
	self assert: (bucket at: testKey) context notNil
	