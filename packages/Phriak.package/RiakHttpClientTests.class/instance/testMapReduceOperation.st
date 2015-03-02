testing
testMapReduceOperation
	"Tests the client>>mapReduceOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client mapReduceOperation.
	self assert: (operation isKindOf: RiakMapReduceOperation).
	self assert: operation client = client.