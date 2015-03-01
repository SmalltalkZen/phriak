tests
testIndexes
	| bucket index1 index2 |
	index1 := RiakIndex key: 'hello' value: 'world'.
	index2 := (RiakIndex key: 'foo' value: '201') beInteger.
	bucket := self bucketForTesting.
	bucket newObject
		key: 'test';
		data: 'abc';
		indexes: {index1. index2};
		store.
	
	self assert: ((bucket at: 'test') indexes size = 2).
	self assert: ((bucket at: 'test') indexes includes: index1).
	self assert: ((bucket at: 'test') indexes includes: index2)