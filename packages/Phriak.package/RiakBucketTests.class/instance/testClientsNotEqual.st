testing
testClientsNotEqual
	"Test the = method"

	| bucket1 bucket2 client1 client2 |
	client1 := RiakClient http
		host: 'localhost';
		port: 8098;
		yourself.
	client2 := RiakClient http
		host: '1.1.1.1';
		port: 1234;
		yourself.
	bucket1 := client1 bucketNamed: 'test-bucket'.
	bucket2 := client2 bucketNamed: 'test-bucket'.
	self deny: bucket1 = bucket2