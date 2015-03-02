testing
testFetchObjectOperation
	"Tests the client>>fetchObjectOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client fetchObjectOperation.
	self assert: (operation isKindOf: RiakFetchObjectOperation).
	self assert: operation client = client.