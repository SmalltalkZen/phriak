A RiakDevModeOnlyOperation groups all operations that should only be performed while developing, such as List Keys and List Buckets.

For much better ways to list objects in a bucket, look at Riak Search and Secondary Index queries.

These should never be used on production clusters for two reasons:
1) They iterate through ALLthe objects in the cluster (not just in a particular bucket). As such, they are very slow and resource-intensive.

2) They are currently implemented in this library as non-streaming versions. Meaning, there is a buffer somewhere on the server side that is accumulating all of those keys. If the buffer overruns, that process crashes, and the operation will time out.
