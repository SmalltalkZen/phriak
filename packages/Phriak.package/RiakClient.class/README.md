Client interface to a Riak cluster. Use this class as the starting point to interface with Riak.

Riak is Basho's "Dynamo-inspired key/value store with a distributed database network platform"
http://www.basho.com/riak

Instance Variables
	host: aString hostname or ip address of Riak cluster (usually, via a load balancer)
	post: anInteger http port of the Riak cluster

Usage:

"Create a default client (a RiakHttpClient instance) pointing to default host and http port"
client := RiakClient default.

"Set the host, port and client type explicitly"
client := RiakClient http
	host: '127.0.0.1';
	port: 8098;
	yourself.

"You can now reference Riak buckets"
users := client bucketNamed: 'users'.
"or"
cartItems := client allowMultBucketNamed: 'cart_items'.

Instance Variables:
	host: aString - cluster hostname or ip address
	port: anInteger - cluster port number 
		
Client Types Supported:
	http  - currently, only the Http client is supported.
	
Client Types Not Implemented:
	https - Riak supports HTTPS connections to its nodes. TODO: Implement.
	protobuf - ProtocolBuffer connections are faster than HTTP connections. 
		This requires a working Smalltalk ProtoBuf library, however. TODO: Implement.