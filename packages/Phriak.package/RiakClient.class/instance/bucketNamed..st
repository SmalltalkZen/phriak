creation
bucketNamed: aString
	"Return a RiakBucket instance with the specified name"
	
	^RiakBucket name: aString client: self