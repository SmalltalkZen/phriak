A RiakAllowMultObject is an object that will be stored in a RiakAllowMultBucket. That is, multiple versions (siblings) have been enabled for this bucket, and it is now up to the client application to resolve 
(See http://docs.basho.com/riak/latest/dev/using/conflict-resolution/ for more discussion).

Note: RiakAllowMultObjects should only be used with buckets that have multiple siblings enabled (see the docs for the RiakAllowMultBucket class)

When first created, an object has only one version. Multiple versions/siblings can be created during write collisions (if the causal context is missing or Riak is unable to automatically resolve the conflict from it). 

