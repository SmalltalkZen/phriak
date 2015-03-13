testing
testSetBucketOperation
	"Tests the client>>setBucketOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client setBucketPropsOperation.
	self assert: (operation isKindOf: RiakSetBucketOperation).
	self assert: operation client = client.