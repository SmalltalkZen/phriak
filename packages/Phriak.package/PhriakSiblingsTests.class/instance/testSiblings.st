tests
testSiblings
	| bucket siblings o1 o2 |
	
	"Set the property 'allow_mult' to true first on the bucket.
	See http://docs.basho.com/riak/latest/theory/concepts/Vector-Clocks/"
	
	bucket := self bucketForTesting.
	bucket removeAll.
	(Delay forSeconds: 2) wait.
	
	bucket properties at: 'allow_mult' put: true.
	bucket storeProperties.
	
	bucket newObject
		key: 'test';
		data: '1';
		store.
		
	o1 := bucket at: 'test'.
	o2 := bucket at: 'test'.
	
	o1 data: '2'; store.
	o2 data: '3'; store.
	
	self should: [bucket at: 'test'] raise: RiakConflictError.
	[bucket at: 'test']
		on: RiakConflictError 
		do: [:ex |
			siblings := ex siblings.
			self assert: ex bucket equals: bucket.
			self assert: siblings size equals: 2].
		
	self assert: (bucket at: 'test' vtag: siblings first) key equals: 'test'.
	self assert: (bucket at: 'test' vtag: siblings last) key equals: 'test'.