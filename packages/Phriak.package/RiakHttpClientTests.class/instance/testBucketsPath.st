testing
testBucketsPath
	"Tests base URL formation (for the default host and port)"

	| client |
	client := RiakClient http.
	self assert: client bucketsPath = 'buckets'