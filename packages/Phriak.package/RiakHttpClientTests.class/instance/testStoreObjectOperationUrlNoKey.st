testing
testStoreObjectOperationUrlNoKey
	"Test the URL of the Store Object operation when an object has no key"

	| rObject bucket client op |
	client := RiakClient default.
	bucket := client bucketNamed: 'test-bucket'.
	rObject := bucket newObject
		key: 'test-object-no-bucket';
		yourself.
	op := client storeObjectOperation
		bucket: bucket;
		object: rObject;
		yourself.
	self assert: op url asString = 'http://localhost:8098/buckets/test-bucket/keys?returnbody=true'