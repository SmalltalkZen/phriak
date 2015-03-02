testing
testSecondaryIndexOperation
	"Tests the client>>secondaryIndexOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client secondaryIndexOperation.
	self assert: (operation isKindOf: RiakSecondaryIndexOperation).
	self assert: operation client = client.