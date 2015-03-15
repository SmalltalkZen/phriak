tests
testMapReducePath
	"Tests default url segment of the MapReduce resource"

	client := RiakClient http.
	self assert: client mapReducePath = 'mapred'