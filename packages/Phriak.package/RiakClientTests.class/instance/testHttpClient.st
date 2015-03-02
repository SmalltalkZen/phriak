testing
testHttpClient
	"Test the properties of a RiakHttpClient instance"
	
	| client |
	client := RiakClient http
		host: 'localhost';
		port: 8098;
		yourself.
	self assert: client isHttp.  "a RiakHttpClient instance"
	self assert: client host = 'localhost'.
	self assert: client port = 8098.