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
	- The various versions of an object. A regular RiakObject should only have 1 sibling. 
	If you're going to enable multiple siblings and conflict resolution, use RiakAllowMultObject instead.
	When performing updates to a regular RiakObject, make sure to pass in a recent causal context (by reading before you write), otherwise the database uses the timestamp to determine which update is correct ("last write wins" behavior) in case of simultaneous updates to the same object.
													
