testing
testPutAndGetString
	| bucket storedValue testKey |
	storedValue := 'abc'.
	bucket := self bucketForTesting.
	testKey := 'test-string'.
	bucket newObject
		data: storedValue;
		key: testKey;
		store.
	self assert: (bucket at: testKey) data = storedValue