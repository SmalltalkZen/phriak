tests
testPutAndGetBinaryObject
	| bucket storedObject |
	storedObject := ByteArray with: 1 with: 2 with: 3.
	bucket := self bucketForTesting.
	bucket newObject
		data: storedObject;
		key: 'test';
		contentType: 'application/binary';
		store.
	self assert: (bucket at: 'test') data = storedObject