testing
testEquals
	"Test the = method"

	| client1 client2 |
	client1 := RiakHttpClient  new
		host: '1.1.1.1';
		port: 1234;
		yourself.
	client2 := RiakHttpClient new
		host: '1.1.1.1';
		port: 1234;
		yourself.
	self assert: client1 = client2