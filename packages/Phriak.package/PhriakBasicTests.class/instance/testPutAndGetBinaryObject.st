tests
testPutAndGetBinaryObject
	| testKey bucket storedValue |
	storedValue := ByteArray with: 1 with: 2 with: 3.
	bucket := self bucketForTesting.
	testKey := 'test-binary'.
	bucket newObject
		data: storedValue;
		key: testKey;
		contentType: 'application/binary';
		store.
	self assert: (bucket at: testKey) data = storedValue