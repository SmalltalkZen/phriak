tests
testSiblings
	"Test to make sure that siblings (multiple versions) are created when multiple writes are made to the same key without first fetching the causal context. Requires a bucket with siblings enabled in the properties via 'allow_mult'."

	| bucket testKey object validValues v1 v2 v3 |
	"Set the property 'allow_mult' to true first on the bucket.
	See http://docs.basho.com/riak/latest/theory/concepts/context/#Siblings"
	bucket := self bucketForTesting.
	bucket properties at: 'allow_mult' put: true.
	bucket storeProperties.	"Wait for the settings to be propagated around the cluster"
	(Delay forSeconds: 2) wait.
	
	testKey := 'test-siblings'.
	bucket newObject
		key: testKey;
		data: 'value1';
		store.
	bucket newObject
		key: testKey;
		data: 'value2';
		store.
	bucket newObject
		key: testKey;
		data: 'value3';
		store.
	object := bucket at: testKey.
	self assert: object hasConflicts.
	self assert: object siblingTags size equals: 3.
	self should: [ object data ] raise: RiakConflictError.
	self should: [ object store ] raise: RiakConflictError.	
	validValues := #('value1' 'value2' 'value3'). 
	"Fetch each version of the object individually"
	v1 := bucket at: testKey vtag: object siblingTags first.
	self assert: (validValues includes: v1 data).
	v2 := bucket at: testKey vtag: object siblingTags second.
	self assert: (validValues includes: v2 data).
	v3 := bucket at: testKey vtag: object siblingTags third.
	self assert: (validValues includes: v3 data).
	self deny: v1 data = v2 data.
	self deny: v1 data = v3 data.
	self deny: v2 data = v3 data