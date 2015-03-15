testing
testObjectClassesNotEqual
	"Test the = method"

	| bucket1 bucket2 |
	bucket1 := RiakClient default
		bucketNamed: 'test-bucket'.
	bucket1 objectClass: RiakObject.
	
	bucket2 := RiakClient default
		bucketNamed: 'test-bucket'.
	bucket2 objectClass: Dictionary.
	self deny: bucket1 = bucket2