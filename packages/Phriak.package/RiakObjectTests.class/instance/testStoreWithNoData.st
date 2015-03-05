testing
testStoreWithNoData
	"Test that an error is raised when trying to store an object with nil data"

	| rObject bucket |
	bucket := RiakClient default 
				bucketNamed: 'test-bucket'.
	rObject := bucket
				newObject
				key: 'test-object-no-bucket';
				yourself.
		
	self should: [ rObject store ] raise: RiakProtocolError