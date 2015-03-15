testing
testEquals
	"Test the = method"

	| obj1 obj2 bucket |
	bucket := RiakClient default bucketNamed: 'test-bucket'.
	obj1 := bucket newObject
		key: 'test-key';
		data: 'some text data';
		yourself.
	obj2 := bucket newObject
		key: 'test-key';
		data: 'some text data';
		yourself.
	self assert: obj1 = obj2