testing
testSecondaryIndex
	| bucket index |
	index := RiakIndex key: 'hello' value: 'world'.
	bucket := self bucketForTesting.
	bucket newObject
		key: 'test';
		data: 'abc';
		indexes: {index};
		store.
	RiakObject new
		bucket: bucket;
		key: 'test2';
		data: 'abc';
		indexes: {index};
		store.
	self assert: ((bucket keysIndexed: index key value: index value) includes: 'test').
	self assert: ((bucket keysIndexed: index key value: index value) includes: 'test2').
	self assert: (bucket keysIndexed: index key value: index value) size = 2