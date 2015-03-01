tests
testPutAndGetEmptyString
	"Empty objects will return as nil. This does not mean that the k/v is not there. "
	| bucket storedObject |
	storedObject := ''.
	bucket := self bucketForTesting.
	bucket newObject
		data: storedObject;
		key: 'test';
		store.
	self assert: (bucket at: 'test') data isNil