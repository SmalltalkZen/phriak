tests
testPutAndGetBinaryObject
	| testKey bucket storedObject |
	storedObject := ByteArray with: 1 with: 2 with: 3.
	bucket := self bucketForTesting.
	testKey := 'test-binary'.
	bucket newObject
		data: storedObject;
		key: testKey;
		contentType: 'application/binary';
		store.
	self assert: (bucket at: testKey) data = storedObject