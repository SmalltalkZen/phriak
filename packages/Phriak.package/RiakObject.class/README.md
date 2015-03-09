RiakObject represents the data and metadata stored in a bucket/key pair in the Riak database, the base unit of data manipulation.

A RiakObject knows its cluster and is saved on #store call.
Its data can be a String or ByteArray

Instance Variables
	bucket: aRiakBucket to which this object belongs to
	contentType: aString
	context: aString
	data: aString or aByteArray
	etag: aString
	indexes: aCollection of RiakIndex objects
	key: aString
	lastModified: anObject 
	metadata: anObject
	siblingTags: anOrderedCollection of strings (sibling vtags)
	
bucket
	- A RiakBucket instance to which the object belongs, used store operations
	
contentType 
	- A valid MIME content type. This is for developer convenience, Riak is content-agnostic
	
context
	- Causal context, used to track object version changes. See 
	  http://docs.basho.com/riak/latest/theory/concepts/context/ for discussion.

etag
	- ETag (entity tag in the HTTP sense), used for conditional HTTP operations (if-not-modified, etc)
													
siblingTags
	- A set of strings representing sibling vtags. These are 'version tags' denoting conflicting versions 
		of an object.