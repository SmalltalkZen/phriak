testing
testNamesNotEqual
	"Test the = method"

	| bucket1 bucket2 |
	bucket1 := RiakClient default
		bucketNamed: 'test-bucket-one'.
	bucket2 := RiakClient default
		bucketNamed: 'test-bucket-two'.
	self deny: bucket1 = bucket2