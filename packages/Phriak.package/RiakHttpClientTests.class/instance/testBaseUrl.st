testing
testBaseUrl
	"Tests base URL formation (for the default host and port)"

	| client |
	client := RiakClient http.
	self assert: client baseUrl asString = 'http://localhost:8098/'