testing
testRegisterResolver
	"Test of the 'register a resolver' functionality"

	| bucket testResolver |
	bucket := RiakClient default allowMultBucketNamed: 'test-allow-mult-bucket'.
	self assert: bucket resolvers isEmpty.
	self assert: bucket newObject resolvers isEmpty.
	
	testResolver := self resolverForTesting.
	bucket registerResolver: testResolver.
	
	self assert: bucket resolvers size = 1.
	self assert: bucket resolvers first = testResolver.	"An object delegates to its bucket's resolvers"
	self assert: bucket resolvers = bucket newObject resolvers.