testing
testBuckets
	"Tests the presence of the 'List Buckets' API call method"

	| client |
	client := RiakClient http.
	self assert: (client respondsTo: #buckets)