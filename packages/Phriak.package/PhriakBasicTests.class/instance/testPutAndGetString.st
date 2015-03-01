tests
testPutAndGetString
	| bucket storedObject |
	storedObject := 'abc'.
	bucket := self bucketForTesting.
	bucket newObject
		data: storedObject;
		key: 'test';
		store.
	self assert: (bucket at: 'test') data = storedObject