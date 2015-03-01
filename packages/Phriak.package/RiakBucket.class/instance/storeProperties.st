public
storeProperties
	"Store the bucket properties.
	Fails if the properties have not been read yet!"

	properties ifNil: [
		RiakProtocolError signal: 'The bucket [', self name, '] properties have not been read yet.'].
	
	self protocol setBucketOperation 
		bucket: self;
		run