tests
testPutAndGetLargeBinaryObject
	| bucket storedObject testKey |
	storedObject := ByteArray new: 1024 * 1024 * 2 withAll: 123.
	bucket := self bucketForTesting.
	testKey := 'test-large-binary'.
	bucket newObject
		data: storedObject;
		key: testKey;
		contentType: 'application/binary';
		store.
	self assert: (bucket at: testKey) data = storedObject