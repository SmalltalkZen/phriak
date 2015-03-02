tests
testLinks
	| bucket  testKey |
	bucket := self bucketForTesting.
	testKey := 'test-links'.
	bucket newObject
		key: testKey;
		data: 'abc';
		linkTo: 'hello' key: 'world' tag: 'foo';
		linkTo: 'foo' key: 'bar' tag: 'baz';
		store.
	
	self assert: ((bucket at: testKey) links size = 2).
	self assert: ((bucket at: testKey) links includes: 
		(RiakLink bucket: 'hello' key: 'world' tag: 'foo')).
	self assert: ((bucket at: testKey) links includes: 
		(RiakLink bucket: 'foo' key: 'bar' tag: 'baz'))