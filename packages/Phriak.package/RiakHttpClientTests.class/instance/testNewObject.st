testing
testNewObject
	"Test the initial values of a new http client"

	| client |
	client := RiakHttpClient new.
	self assert: client isHttp.
	self assert: client host = RiakHttpClient defaultHost.
	self assert: client port = RiakHttpClient defaultHttpPort