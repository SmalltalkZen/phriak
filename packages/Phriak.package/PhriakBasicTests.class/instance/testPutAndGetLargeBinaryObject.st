tests
testPutAndGetLargeBinaryObject
	| bucket storedValue testKey |
	storedValue := ByteArray new: 1024 * 1024 * 2 withAll: 123.
	bucket := self bucketForTesting.
	testKey := 'test-large-binary'.
	bucket newObject
		data: storedValue;
		key: testKey;
		contentType: 'application/binary';
		store.
	self assert: (bucket at: testKey) data = storedValue