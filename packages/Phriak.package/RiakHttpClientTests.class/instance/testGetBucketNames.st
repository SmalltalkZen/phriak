testing
testGetBucketNames
	"Tests the presence of the 'List Bucket Names' API call method"

	| client |
	client := RiakClient http.
	self assert: (client respondsTo: #devModeOnlyGetBucketNames)