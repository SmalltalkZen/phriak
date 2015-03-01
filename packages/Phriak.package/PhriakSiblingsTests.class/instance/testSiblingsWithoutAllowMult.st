tests
testSiblingsWithoutAllowMult
	| bucket o1 o2 |
	
	"Set the property 'allow_mult' to true first on the bucket.
	See http://docs.basho.com/riak/latest/theory/concepts/Vector-Clocks/"
	
	bucket := RiakSession default bucketNamed: self bucketNameForTesting, '2'.
	bucket removeAll.
	(Delay forSeconds: 2) wait.
	
	bucket properties at: 'allow_mult' put: false.
	bucket storeProperties.
	
	bucket newObject
		key: 'test';
		data: '1';
		store.
		
	o1 := bucket at: 'test'.
	o2 := bucket at: 'test'.
	
	o1 data: '2'; store.
	o2 data: '3'; store.
	
	self shouldnt: [bucket at: 'test'] raise: RiakConflictError.
	
	"Last write wins!"
	self assert: (bucket at: 'test') data equals: '3'