testing
testMapReduce
	"Tests the client>>mapReduce factory method"

	| client operation |
	client := RiakClient http.
	operation := client mapReduce.
	self assert: (operation isKindOf: RiakMapReduce).
	self assert: operation client = client.