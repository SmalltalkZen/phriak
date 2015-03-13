operations
storeProperties
	"Store the bucket properties.
	Fails if the properties have not been read yet!"

	properties ifNil: [
		RiakProtocolError new 
			bucket: self;
			signal: 'The bucket [', self name, '] properties have not been read yet.'].
	
	self client setBucketPropsOperation 
		bucket: self;
		run