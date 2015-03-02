testing
testListKeysOperation
	"Tests the client>>listKeysOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client listKeysOperation.
	self assert: (operation isKindOf: RiakListKeysOperation).
	self assert: operation client = client.