testing
testStoreWithNoBucket
	"Test that an error is raised when trying to store an object with no bucket"

	| rObject |
	rObject := RiakObject new
		key: 'test-object-no-bucket';
		data: 'test-value1'.
	self should: [ rObject store ] raise: RiakProtocolError