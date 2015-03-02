testing
testDeleteKeyOperation
	"Tests the client>>deleteKeyOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client deleteKeyOperation.
	self assert: (operation isKindOf: RiakDeleteKeyOperation).
	self assert: operation client = client.