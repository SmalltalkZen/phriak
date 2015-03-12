tests
testReloadObject
	| bucket storedValue reloadedObject testKey obj |
	storedValue := 'abc'.
	bucket := self bucketForTesting.
	testKey := 'test-reloaded-string'.
	bucket newObject
		data: storedValue;
		key: testKey;
		store.
	obj := bucket at: testKey.
	reloadedObject := bucket reload: obj.
	self assert: reloadedObject data = storedValue.
	self assert: reloadedObject key = testKey.
	self assert: obj etag isNotNil.
	self assert: obj etag isNotEmpty.
	self assert: obj etag = reloadedObject etag.
	self assert: obj isDeleted not