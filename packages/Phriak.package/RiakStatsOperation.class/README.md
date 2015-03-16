A RiakStatusOperation gets the 'stats' JSON object from a Riak node.

For a list of stats and their meanings, see:
- http://docs.basho.com/riak/latest/dev/references/http/status/
- http://docs.basho.com/riak/latest/ops/running/nodes/inspecting/

Usage:

   stats := RiakClient default stats.
   stats at: 'node_gets'.  "=>  123"