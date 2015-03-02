tests
testPutAndGetEmptyString
	"Empty objects will return as nil. This does not mean that the k/v is not there. "
	| bucket storedObject testKey |
	storedObject := ''.
	bucket := self bucketForTesting.
	testKey := 'test-empty-string'.
	bucket newObject
		data: storedObject;
		key: testKey;
		store.
	self assert: (bucket at: testKey) data isNil