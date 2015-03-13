testing
testGetBucketOperation
	"Tests the client>>getBucketOperation factory method"

	| client operation |
	client := RiakClient http.
	operation := client getBucketPropsOperation.
	self assert: (operation isKindOf: RiakGetBucketOperation).
	self assert: operation client = client.