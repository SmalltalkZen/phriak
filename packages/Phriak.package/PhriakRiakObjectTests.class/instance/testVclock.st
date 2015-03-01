tests
testVclock
	| bucket object vclock |
	bucket := self bucketForTesting.
	 bucket newObject
		key: 'test';
		data: 'abc';
		store.
	object := bucket at: 'test'.
	vclock := object vclock.
	object store.
	self deny: (bucket at: 'test') vclock = vclock.
	self assert: (bucket at: 'test') vclock notNil
	