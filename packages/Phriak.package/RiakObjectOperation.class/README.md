A RiakObjectOperation groups all the operations that are performed on an individual Riak object (get, store, remove, etc)

Instance Variables
	bucket:		<aRiakBucket>
	key:		<aString>
	object:		<aRiakObject>

bucket
	- A RiakBucket instance

key
	- [Optional] A string key for the object to perform this operation on. If this is absent (such as for an "insert" HTTP POST type of operation, Riak will generate and return the key).

object
	- [Optional] An instance of RiakObject on which to perform this operation. The object is mainly passed along to extract headers (context, indexes, etc)
