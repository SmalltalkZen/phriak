RiakObject represents the data and metadata stored in a bucket/key pair in the Riak database, the base unit of data manipulation.

A RiakObject knows its cluster and is saved on #store call.
Its data can be a String or ByteArray

Instance Variables
	bucket: aRiakBucket to which this object belongs to
	contentType: aString
	data: aString or aByteArray
	indexes: aCollection of RiakIndex objects
	key: aString
	lastModified: anObject 
	metadata: anObject
	vclock: anObject
	