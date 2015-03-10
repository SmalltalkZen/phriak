A RiakObjectContent represents a particular version of an object's value.

Instance Variables
	contentType:		<String>
	data:		<Object>
	etag:		<String>
	indexes:		<OrderedCollection>
	lastModified:		<DateTime>
	metadata:		<Dictionary>

contentType 
	- A valid MIME content type. This is for developer convenience, Riak is content-agnostic

data
	- A string or byte array value for the object. This is the "payload".

etag
	- ETag (entity tag in the HTTP sense), used for conditional HTTP operations (if-not-modified, etc). Unique identifier for this particular content/object version.

indexes
	- An OrderedCollection of RiakIndex instances. See http://docs.basho.com/riak/latest/dev/advanced/2i/ for Secondary Index overview.

lastModified
	- A DateTime stamp of when the object was last modified.

metadata
	- A Dictionary of custom user-defined headers that can be stored with the object.
