RiakObject represents the data and metadata stored in a bucket/key pair in the Riak database, the base unit of data manipulation.

A RiakObject knows its cluster and is saved on #store call.
Its data can be a String or ByteArray

Instance Variables
	bucket: aRiakBucket to which this object belongs to
	context: aString
	key: aString
	siblings: anOrderedCollection of RiakObjectContent instances
	
bucket
	- A RiakBucket instance to which the object belongs, used store operations. An object serves as a namespace for keys (on the server side, it's literally used as a prefix for a key), and also a way to store custom configurations.
	
context
	- Causal context (vclock), used to track object version changes. See 
	  http://docs.basho.com/riak/latest/theory/concepts/context/ for discussion. 
	  Having fresh (recent) causal context objects helps with not creating write conflicts. When updating or deleting, it is recommended that you read-before-you-write (ie reload the object, which fetches the latest context, before updating its value).
						
key
	- A unique (at least, within the bucket) string identifier for the object. If a key is not given, Riak will generate and return a UUID-type key when an object is stored.

siblings
	- The various versions of an object. When first created, an object has only one version. Multiple versions/siblings can be created during write collisions (if the causal context is missing or Riak is unable to automatically resolve the conflict from it). Note: Multiple siblings can only be created if the bucket has 'allow_mult' set to true. Otherwise, the bucket defaults to 'last write wins' behavior. 
	See http://docs.basho.com/riak/latest/dev/using/conflict-resolution/ for more discussion.
													
