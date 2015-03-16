testing
testPutAndGetEmptyString
	"Empty objects will return as nil. This does not mean that the k/v is not there. "
	| bucket storedValue testKey |
	storedValue := ''.
	bucket := self bucketForTesting.
	testKey := 'test-empty-string'.
	bucket newObject
		data: storedValue;
		key: testKey;
		store.
	self assert: (bucket at: testKey) data isNil