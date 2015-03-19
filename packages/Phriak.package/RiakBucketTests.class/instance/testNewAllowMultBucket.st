testing
testNewAllowMultBucket
	"Test the initial values of a new bucket"

	| bucket |
	bucket := RiakAllowMultBucket new.
	self assert: bucket client isNil.
	self assert: bucket name isNil.
	self assert: bucket resolvers isEmpty.
	self assert: bucket objectClass = RiakAllowMultObject