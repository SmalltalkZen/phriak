tests
testPutAndGetEmptyBinaryObject
	"Empty objects will return as nil. This does not mean that the k/v is not there. "
	| bucket storedObject |
	storedObject := ByteArray new.
	bucket := self bucketForTesting.
	bucket newObject
		data: storedObject;
		key: 'test';
		contentType: 'application/binary';
		store.
	self assert: (bucket at: 'test') data isNil