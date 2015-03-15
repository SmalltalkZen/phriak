testing
testNewObject
	"Test the initial values of a new bucket"

	| bucket |
	bucket := RiakBucket new.
	self assert: bucket client isNil.
	self assert: bucket name isNil.
	self assert: bucket objectClass = RiakObject