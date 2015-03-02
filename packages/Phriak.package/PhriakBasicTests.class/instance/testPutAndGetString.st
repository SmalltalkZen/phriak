tests
testPutAndGetString
	| bucket storedObject testKey |
	storedObject := 'abc'.
	bucket := self bucketForTesting.
	testKey := 'test-string'.
	bucket newObject
		data: storedObject;
		key: testKey;
		store.
	self assert: (bucket at: testKey) data = storedObject