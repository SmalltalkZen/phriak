tests
testLinks
	| bucket  |
	bucket := self bucketForTesting.
	bucket newObject
		key: 'test';
		data: 'abc';
		linkTo: 'hello' key: 'world' tag: 'foo';
		linkTo: 'foo' key: 'bar' tag: 'baz';
		store.
	
	self assert: ((bucket at: 'test') links size = 2).
	self assert: ((bucket at: 'test') links includes: 
		(RiakLink bucket: 'hello' key: 'world' tag: 'foo')).
	self assert: ((bucket at: 'test') links includes: 
		(RiakLink bucket: 'foo' key: 'bar' tag: 'baz'))