testing
testDefaultClient
	"Test the properties of a default client instance"
	
	| client |
	client := RiakClient default.
	self assert: client isHttp.  "a RiakHttpClient instance"
	self assert: client host = RiakClient defaultHost.
	self assert: client port = RiakClient defaultHttpPort.