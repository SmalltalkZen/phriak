testing
testNewObjectsEqual
	"Test the initial values of a new object"

	| content1 content2 |
	content1 := RiakObjectContent new.
	content2 := RiakObjectContent new.
	self assert: content1 = content2