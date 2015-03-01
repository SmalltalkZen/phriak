tests
testPutAndGetLargeBinaryObject
	| bucket storedObject |
	storedObject := ByteArray new: 1024 * 1024 * 2 withAll: 123.
	bucket := self bucketForTesting.
	bucket newObject
		data: storedObject;
		key: 'test';
		contentType: 'application/binary';
		store.
	self assert: (bucket at: 'test') data = storedObject