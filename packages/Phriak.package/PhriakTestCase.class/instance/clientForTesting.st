running
clientForTesting
	| testProtocol |
	"Return an instance of a Riak HTTP client pointing to a test cluster"
	
	testProtocol := RiakProtocol new
		host: 'localhost';
		port: 8098;
		yourself.
		
	^RiakSession on: testProtocol.