running
clientForTesting
	"Return an instance of a Riak HTTP client pointing to a test cluster"
	
	^RiakClient http
		host: 'localhost';
		port: 8098;
		yourself.
