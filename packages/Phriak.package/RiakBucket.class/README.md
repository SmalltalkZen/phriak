Represents a "bucket" in Riak. Buckets can be thought of as namespaces to store objects in,
and containers for custom settings. Buckets do not exist in any real sense in the Riak cluster (unlike tables in traditional relational databases).

You may retrieve a bucket using "aRiakClient bucketNamed: aString"

Instance Variables
	client:		a RiakClient instance
	name:		a String
	objectClass: 	<Object>
	properties:		a Dictionary
	resolvers:		<OrderedCollection>			

client
	- a RiakClient instance, for performing get/put operations

name
	- Bucket name. 

objectClass
	- the class of objects that will be stored in this bucket (RiakObject, by default). Used by RiakBucket>>newObject.

properties
	- Properties dictionary, cache of the results of a RiakGetBucketOperation. Used to store custom bucket properties such as read/write quorums, search indexes, etc. See http://docs.basho.com/riak/latest/dev/references/http/set-bucket-props/ for available bucket properties.

