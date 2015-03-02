A PhriakTestCase performs tests against the RIak HTTP API.
See http://docs.basho.com/riak/latest/dev/references/http/

Requires an active Riak connection.

The default Riak test url is http://localhost:8098/
See PhriakTestCase>>clientForTesting to change the host and port.

Instance Variables

client
	a RiakClient subclass instance (initialized in >>clientForTesting)
