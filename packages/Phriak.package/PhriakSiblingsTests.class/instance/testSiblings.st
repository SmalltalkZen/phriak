tests
testSiblings
	"Test to make sure that siblings (multiple versions) are created when multiple writes are made to the same key without first fetching the causal context. Requires a bucket with siblings enabled in the properties via 'allow_mult'."

	| bucket testKey object validValues |
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
	self assert: object siblings size equals: 3.
	self should: [ object content ] raise: RiakConflictError.
	self should: [ object store ] raise: RiakConflictError.
	validValues := #('value1' 'value2' 'value3').
	object siblings do: [ :each | self assert: (validValues includes: each data) ].
	self deny: object siblings first data = object siblings second data.
	self deny: object siblings first etag = object siblings second etag.
	self deny: object siblings first data = object siblings third data.
	self deny: object siblings first etag = object siblings third etag.
	self deny: object siblings third data = object siblings second data.
	self deny: object siblings third etag = object siblings second etag