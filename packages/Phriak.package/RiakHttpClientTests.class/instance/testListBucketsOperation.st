testing
testListBucketsOperation
	"Tests the client>>devModeOnlyListBucketsOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client devModeOnlyListBucketsOperation.
	self assert: (operation isKindOf: RiakListBucketsOperation).
	self assert: operation client = client.