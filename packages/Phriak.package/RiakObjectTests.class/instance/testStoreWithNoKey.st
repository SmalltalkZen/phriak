testing
testStoreWithNoKey
	"Test that an error is raised when trying to store an object with no key"

	| rObject bucket |
	bucket := RiakClient default 
				bucketNamed: 'test-bucket'.
	rObject := bucket
				newObject
				data: 'test-data';
				yourself.
		
	self should: [ rObject store ] raise: RiakProtocolError