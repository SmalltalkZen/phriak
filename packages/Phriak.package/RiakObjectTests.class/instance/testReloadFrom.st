testing
testReloadFrom
	"Test the #reloadFrom: method"

	| obj1 obj2 bucket |
	
	bucket := RiakClient default bucketNamed: 'test-bucket'.
	obj1 := bucket newObject
		key: 'test-key';
		etag: 'abc123';
		data: 'some text data';
		yourself.
	
	obj2 := bucket newObject
		key: 'test-key';
		yourself.
		
	obj1 reloadFrom: obj2.
	self assert: obj1 = obj2