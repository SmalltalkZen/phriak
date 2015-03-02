testing
testListBucketsOperation
	"Tests the client>>listBucketsOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client listBucketsOperation.
	self assert: (operation isKindOf: RiakListBucketsOperation).
	self assert: operation client = client.