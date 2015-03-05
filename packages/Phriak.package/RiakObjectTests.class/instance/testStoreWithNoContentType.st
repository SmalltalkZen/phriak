testing
testStoreWithNoContentType
	"Test that an error is raised when trying to store an object with a nil contentType"

	| rObject bucket |
	bucket := RiakClient default 
				bucketNamed: 'test-bucket'.
	rObject := bucket
				newObject
				key: 'test-object-no-bucket';
				data: 'test-data';
				yourself.
		
	rObject contentType: nil.
	self should: [ rObject store ] raise: RiakProtocolError