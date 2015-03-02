RiakSecondaryIndexOperation represents a secondary indexes HTTP request.

It can either request an exact value, or a range (from start to end).

See http://docs.basho.com/riak/latest/dev/advanced/2i/

WARNING: Requires that the LevelDB back end is turned on in the Riak cluster config file.
See http://docs.basho.com/riak/latest/ops/advanced/backends/leveldb/ for setup instructions.