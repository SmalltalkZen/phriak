tests
testMapReduceOperation
	"Tests the client>>mapReduceOperation factory method"

	| operation |
	client := RiakClient http.
	operation := client mapReduceOperation.
	self assert: (operation isKindOf: RiakMapReduceOperation).
	self assert: operation client = client