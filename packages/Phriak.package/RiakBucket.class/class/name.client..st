instance creation
name: aString client: aRiakClient
	"Return a RiakBucket instance for a given name, associate it with a client"

	^ self new
		name: aString;
		client: aRiakClient;
		yourself