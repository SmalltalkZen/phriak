testing
testBucketCreation
	"Test the creation of a Riak Bucket"
	
	| bucket client |
	client := RiakClient default.
	bucket := client bucketNamed: 'users'.
	self assert: (bucket isKindOf: RiakBucket).
	self assert: bucket name = 'users'.
	self assert: bucket client = client.