# Phriak
Phriak is a Smalltalk client for the [Riak NoSQL database](http://basho.com/riak/) (primarily for [Pharo Smalltalk](http://pharo.org/)).

This is also mirrored on [Phriak's SmalltalkHub Monticello repository](http://smalltalkhub.com/#!/~gokr/Phriak) (using [FileTree](https://github.com/dalehenrich/filetree)).

Phriak started as a friendly fork from Runar Jordahl's original [EpigentRiakInterface](http://blog.epigent.com/2011/03/riak-interface-for-pharo-smalltalk.html). Riak is a screamingly cool NoSQL database that scales like crazy. This Riak interface implementation uses Zinc HTTP and the JSON package.

## Installing the Package
The easiest way to load it into a Pharo 2.0+ image is via Metacello.

Add a SmalltalkHub Monticello repository:

```smalltalk
MCSmalltalkhubRepository
	owner: 'gokr'
	project: 'Phriak'
	user: ''
	password: ''
```

Install the ```ConfigurationOfPhriak``` package. Then ```load``` the dependencies:

```smalltalk
(ConfigurationOfPhriak project version: '0.7') load
```

## Usage
### Creating a client instance
To use Riak, create a client instance:

```smalltalk
"Create a default client (a RiakHttpClient instance) pointing to default host and http port"client := RiakClient default."Or, set the host, port and client type explicitly"client := RiakClient http	host: '127.0.0.1';	port: 8098;	yourself.
```

**Note:** For clusters with more than one node, the host and port should [point to a load
balancer](http://docs.basho.com/riak/latest/ops/advanced/configs/load-balancing-proxy/) (such as HAProxy or Nginx). Do not instantiate a separate client for each node.
### Reading and Writing (CRUD)
```smalltalk"Reference a bucket"users := client bucketNamed: 'users'.

"Write an object to a bucket"users newObject		data: '{ name: "Dmitri" }';		key: 'user-123';		contentType: 'application/json';		store.
"You can write strings or binaries"images := client bucketNamed: 'user-images'.
images newObject		data: (ByteArray with: 1 with: 2 with: 3);		key: 'user-123';		contentType: 'application/binary';		store."If you don't specify a key, Riak will auto-generate a UUID type key and return it"
storedObj := users newObject		data: '{ name: "Joseph" }';		contentType: 'application/json';		yourself.storedObj store.
storedObj key.  "=> 'bzPygTesROPtGGVUKfyvp2RR49"
"Read objects from a bucket"
currentUser := users at: 'user-123'.

currentUser data. "=> '{ id: \"user-123\", name: \"Dmitri\" }'"
currentUser contentType.  "=> 'application/json'"
currentUser lastModified. "=> 4 March 2015 11:25:49 pm"

"When updating existing objects, read-before-you-write, unless you /know/ you haven't modified it"
currentUser reload.  "Ensure the latest causal context (object version)"
currentUser 
		data: '{ id: "user-123", name: "Some New Value" }';
		store.

"Reloading uses If-Not-Modified HTTP GET conditional headers. But you can override that."
currentUser reloadForce.

"Delete an object. This sends along the causal context, whenever possible."
currentUser remove.```
### Getting and Setting Bucket Properties
Buckets serve as a namespace for keys (on the server-side, they are a prefix for the key). 
The also serve as a way to store custom configuration for a group of keys, 
such as custom replica values, read/write quorums, search indexes, and so on.
See [Riak bucket properties documentation](http://docs.basho.com/riak/latest/dev/references/http/set-bucket-props/) for a list of available properties.

```smalltalk
users := client bucketNamed: 'users'.
"Retrieve a Dictionary of bucket properties from the server"
props := users properties.
props at: 'n_val'.  "=> 3"
"Change the bucket properties"
users properties at: 'allow_mult' put: true.  "Enable siblings for this bucket"users storeProperties.
```

### Conflict Resolution
Riak does not have a central locking mechanism to prevent write conflicts 
(a feature that enables it to provide  high availability, concurrent throughput, and horizontal scalability). 
Instead, it provides several explicit mechanisms that the developer can use to handle and resolve potential write conflicts or race conditions (when several different clients are
concurrently trying to update the same object).

You can you use the following basic [conflict resolution strategies](http://docs.basho.com/riak/latest/dev/using/conflict-resolution/), depending on your use case.

Note: Riak 2.0 introduces two more strategies (CRDTs and Strong Consistency), although these are not yet supported in Phriak.

#### Strategy #1 - Last Write Wins (LWW)
This strategy is the simplest, but is only appropriate when:

- Your data is immutable (you only insert, and never update objects - think log entries)
- You are confident that updates to objects happen infrequently enough that they are unlikely
	to result in write collisions. (Or else you somehow enforce non-concurrent updates).

When this strategy is used, if multiple updates happen to an object, the "**last write wins**".
Meaning, Riak simply looks at the timestamp of the updates to determine which one will take effect. Keep in mind, however, that if the updates to the same object happen almost simultaneously, and given the unpredictable nature of networks, it's impossible for a distributed system to "correctly" guess which update was supposed to be the last one (and so, you're picking at random).

(Incidentally, this is the strategy that several other NoSQL databases take, like Cassandra).

To use this strategy, you can either enable LWW on an individual bucket:

```smalltalk
"Explicitly enable Last Write Wins in the bucket properties (and disable siblings)"
logs := client bucketNamed: 'log_entries'.
logs properties at: 'allow_mult' put: false.  "Disable siblings"
logs properties at: 'last_write_wins' put: true.  logs storeProperties.
```

or enable LWW for the whole cluster [in the config file](http://docs.basho.com/riak/latest/ops/building/configuration/#Default-Bucket-Properties):

**riak.conf**

```
buckets.default.allow_mult = false
buckets.default.last_write_wins = true
```

#### Strategy #2 - Keep ALL the versions, let the App sort them out
This strategy for dealing with conflicts and write collisions shifts the ultimate 
responsibility for figuring out which update is the correct one.
Use it for cases where both of these things are true:

* The data is not immutable (that is, you'll be performing updates, not just inserts)
* You don't want to (or cannot afford to) lose *any* updates, ever.

To use this strategy, you must enable siblings either on the bucket level, or for the whole
cluster.

```smalltalk
cart_items := client bucketNamed: 'shopping_cart_items'.
cart_items properties at: 'allow_mult' put: true.  "Enable siblings"
cart_items properties at: 'dvv_enabled' put: true.  "Use advanced Dotted Version Vectors for context"
cart_items storeProperties.
```

or

**riak.conf**

```
buckets.default.allow_mult = true
buckets.default.dvv_enabled = true
```

Here's how this strategy works:

* Read and write objects as usual.
* Remember to *read-before-you-write*. That is, before updating an object, read it first from the database,
    to load the most recent [causal context](http://docs.basho.com/riak/latest/dev/using/conflict-resolution/#Causal-Context).
* When you write the object, you pass in the most recent causal context (this is done automatically by Phriak, as long as you've fetched or reloaded).
* During updates, if the context (think of it as a version number, bulked up to work with distributed systems) is passed in and is valid, 
    Riak can automatically resolve any conflicts correctly. Meaning, during the normal course of operations, conflicts are auto-resolved, 
    and no siblings are generated.
* If the causal context is missing or stale, and Riak can't reason definitively about which update is the correct one, **all** copies are kept,
    in the form of siblings. 
* The next time you either go to write a loaded object that has siblings, or go to access its data, Phriak raises a ```RiakConflictError```,
    to indicate to the client app that it needs to resolve the siblings. 
* The developer can then decide how to resolve the siblings (to just pick the oldest one, or to ask the user which version is correct, and so on).

```smalltalk
"Most of the time, even when allow_mult=true, no siblings are created:"
users := client bucketNamed: 'users'.
user1 := users at: 'dmitri'.  "Latest version & context fetched"
user1 at: #city.  "=> nil"

user1 at: #city put: 'Portland'.  "Update the object"
user1 store.   "=> No siblings created (if that object has not been updated meanwhile)"

"However, if the context is missing or stale, siblings are created, and a conflict error is raised"
user2 := users newObject
           key: 'dmitri';
           data: '{ "city": "Cleveland" }';
					 yourself.
"Since user2 is a new object, it doesn't have any context."
user2 store.
"Now there are two versions (siblings) of the object with the key 'dmitri'."

userWithConflict := users at: 'dmitri'.
userWithConflict hasConflict.  "=> true"
userWithConflict siblings first data.  => '{ "city": "Portland" }'
userWithConflict siblings second data.  => '{ "city": "Cleveland" }'

userWithConflict store.  "=> raises RiakConflictError"
```

#### Strategy #3 - Use causal context, fall back to timestamp
This is a hybrid strategy, which uses causal context to prevent write collisions or conflicts.
However, when the context is missing or stale, Riak falls back to the timestamp (last write) to determine which version is correct.

To enable it, turn off siblings, but do not use 'last write wins'. 

```smalltalk
cart_items := client bucketNamed: 'shopping_cart_items'.
cart_items properties at: 'allow_mult' put: false.  "Disable siblings"
cart_items properties at: 'last_write_wins' put: false.  
cart_items properties at: 'dvv_enabled' put: true.  "Use advanced Dotted Version Vectors for context"
cart_items storeProperties.
```

or

**riak.conf**

```
buckets.default.allow_mult = false
buckets.default.last_write_wins = false
buckets.default.dvv_enabled = true
```

## Running the Tests
### Unit Tests
The subclasses of ```RiakTestCase``` (such as ```RiakObjectTests```) are intended to be 
unit tests, and don't need a running Riak instance. Those should all pass as-is.

### Integration Tests
The subclasses of ```PhriakIntegrationTestCase``` require an instance of Riak to connect to.

1. Install Riak. On Mac OS X, use [brew install](http://docs.basho.com/riak/latest/ops/building/installing/mac-osx/#Homebrew) or use the pre-built installer at [Riak204.dmg](http://basho.s3.amazonaws.com/Riak204.dmg). On Ubuntu Linux, I recommend [installing from apt or from .deb](http://docs.basho.com/riak/latest/ops/building/installing/debian-ubuntu/))
2. Start riak (usually just ```riak start```), take note of which HTTP port it's listening on (```8098``` by default).
3. Point your test client to the right hostname and port. In ```PhriakIntegrationTestCase>>#clientForTesting```, edit the host and port variables if using non-defaults.

    ```smalltalk
    clientForTesting	"Return an instance of a Riak HTTP client pointing to a test cluster"		^RiakClient http		host: 'localhost';		port: 8098;		yourself.	```
#### Secondary Index Tests
The [Secondary Index](http://docs.basho.com/riak/latest/dev/using/2i/) tests in ```PhriakSecondaryIndexTests``` can only be used with either the [LevelDB](http://docs.basho.com/riak/latest/ops/advanced/backends/leveldb/) or [Memory](http://docs.basho.com/riak/latest/ops/advanced/backends/memory/) backends, and will not work for a default Riak install (which uses the [Bitcask](http://docs.basho.com/riak/latest/ops/advanced/backends/bitcask/) backend).
