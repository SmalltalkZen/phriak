testing
testNewObjectsEqual
	"Two new bucket should be equal"

	| bucket1 bucket2 |
	bucket1 := RiakBucket new.
	bucket2 := RiakBucket new.
	self assert: bucket1 = bucket2