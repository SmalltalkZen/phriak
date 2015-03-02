tests
testVclock
	| bucket object vclock testKey |
	bucket := self bucketForTesting.
	testKey := 'test-vclock'.
	 bucket newObject
		key: testKey;
		data: 'abc';
		store.
	object := bucket at: testKey.
	vclock := object vclock.
	object store.
	self deny: (bucket at: testKey) vclock = vclock.
	self assert: (bucket at: testKey) vclock notNil
	