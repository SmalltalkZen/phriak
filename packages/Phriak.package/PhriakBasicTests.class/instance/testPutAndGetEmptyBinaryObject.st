tests
testPutAndGetEmptyBinaryObject
	"Empty objects will return as nil. This does not mean that the k/v is not there. "
	| bucket storedObject testKey |
	storedObject := ByteArray new.
	bucket := self bucketForTesting.
	testKey := 'test-empty-binary'.
	bucket newObject
		data: storedObject;
		key: testKey;
		contentType: 'application/binary';
		store.
	self assert: (bucket at: testKey) data isNil