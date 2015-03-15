testing
testNewObjectsEqual
	"Test the initial values of a new object"

	| client1 client2 |
	client1 := RiakHttpClient  new.
	client2 := RiakHttpClient new.
	self assert: client1 = client2