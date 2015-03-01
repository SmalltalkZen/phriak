tests
testMetadata
	| bucket object |
	bucket := self bucketForTesting.
	object := bucket newObject
		key: 'test';
		data: 'abc';
		yourself.
	object metadata at: 'hello' put: 'world'.
	object store.
	self assert: ((bucket at: 'test') metadata at: 'hello') equals: 'world'