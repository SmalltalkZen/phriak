A RiakPingOperation performs an HTTP GET to /ping, to check if the Riak node is alive.
Successful ping returns #OK.
Otherwise, raises a RiakNodeNotReachableError


Usage:

	RiakClient default ping.  "=>  #OK"
