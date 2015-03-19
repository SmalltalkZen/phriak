testing
testAllowMultBucketCreation
	"Test the creation of a RiakAllowMultBucket"
	
	| bucket client |
	client := RiakClient default.
	bucket := client allowMultBucketNamed: 'cart_items'.
	self assert: (bucket isKindOf: RiakAllowMultBucket).
	self assert: bucket name = 'cart_items'.
	self assert: bucket client = client.