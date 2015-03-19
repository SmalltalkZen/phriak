creation
allowMultBucketNamed: aString
	"Return a RiakAllowMultBucket instance with the specified name"
	
	^RiakAllowMultBucket name: aString client: self