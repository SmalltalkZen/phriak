*Phriak-MapReduce
testMapReducePath
	"Tests default url segment of the MapReduce resource"

	| client |
	client := RiakClient http.
	self assert: client mapReducePath = 'mapred'