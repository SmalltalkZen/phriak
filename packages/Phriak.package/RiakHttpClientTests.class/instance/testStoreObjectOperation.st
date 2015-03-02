testing
testStoreObjectOperation
	"Tests the client>>storeObjectOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client storeObjectOperation.
	self assert: (operation isKindOf: RiakStoreObjectOperation).
	self assert: operation client = client.