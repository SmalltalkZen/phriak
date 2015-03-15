testing
testEquals
	"Test the = method"

	| bucket1 bucket2 |
	bucket1 := RiakClient default
		bucketNamed: 'test-bucket-1';
		yourself.
	bucket2 := RiakClient default
		bucketNamed: 'test-bucket-1';
		yourself.
	self assert: bucket1 = bucket2