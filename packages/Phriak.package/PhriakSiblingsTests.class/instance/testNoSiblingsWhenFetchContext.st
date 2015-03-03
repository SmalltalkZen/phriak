tests
testNoSiblingsWhenFetchContext
	"Test to make sure that siblings (multiple versions) are NOT created (in a bucket where siblings are enabled) when you make multiple writes to the same key."

	| bucket testKey object |
	"Set the property 'allow_mult' to true first on the bucket.
	See http://docs.basho.com/riak/latest/theory/concepts/context/#Siblings"
	bucket := self bucketForTesting.
	bucket properties at: 'allow_mult' put: true.
	bucket storeProperties.
	"Wait for the settings to be propagated around the cluster"
	(Delay forSeconds: 2) wait.
	
	testKey := 'test-no-siblings-fetch-context'.
	"Make the first write"
	bucket newObject
		key: testKey;
		data: '1';
		store.
	
	"Read-before-you-write for the next value"
	object := bucket at: testKey.
	object 
		data: '2';
		store.
		
	object := bucket at: testKey.
	object 
		data: '3';
		store.
	
	object := bucket at: testKey.
	self deny: object hasConflicts.	"No siblings"
	self assert: object data equals: '3'