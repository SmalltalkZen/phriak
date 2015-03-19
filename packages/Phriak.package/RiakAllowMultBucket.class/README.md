A RiakAllowMultBucket represents a Riak bucket that has been set up to allow multiple siblings (object versions). This is a best-practice pattern, a strategy for conflict resolution (See https://github.com/SmalltalkZen/phriak#conflict-resolution ).

Instance Variables
	resolvers:		<OrderedCollection>
			
resolvers
	- An ordered collection of optional conflict resolver functions. These get invoked, in order,
	whenever an object that has siblings (is in conflict) attempts to read its contents. 
	Their purpose is to automatically resolve the conflict -- that is, to pick the right version out of the list 
	of siblings (object versions). The idea is to then write that resolved version, clearing up the conflict.

This strategy for dealing with conflicts and write collisions shifts the ultimate responsibility (for figuring out which update is the correct one) from the database to the developer. Use it for cases where both of these things are true:

1) The data is not immutable (that is, you'll be performing updates, not just inserts)
2) You don't want to (or cannot afford to) lose any updates, ever.

If you will be using this kind of bucket, make sure the following settings are enabled for it (either via cluster-wide default settings in `riak.conf`, through a Bucket Type, or through a #setBucketProperties call):
(in riak.conf)
buckets.default.allow_mult = true
buckets.default.last_write_wins = false
buckets.default.dvv_enabled = true

(or via a one-time call):
aRiakAllowMultBucket properties
	at: 'allow_mult' put: true;
	at: 'last_write_wins' put: false;
	at: 'dvv_enabled' put: true;
	storeProperties.

Here's how this strategy works:
	- Read and write objects as usual.
	- Remember to read-before-you-write. That is, before updating an object, read it first from the database, to load the most recent causal context.
	- When you write the object, you pass in the most recent causal context (this is done automatically by Phriak, as long as you've fetched or reloaded).
	- During updates, if the context (think of it as a version number, bulked up to work with distributed systems) is passed in and is valid, Riak can automatically resolve any conflicts correctly. Meaning, during the normal course of operations, conflicts are auto-resolved, and no siblings are generated.
	- If the causal context is missing or stale, and Riak can't reason definitively about which update is the correct one, all copies are kept, in the form of siblings. 
	- The next time you either go to write a loaded object that has siblings, or go to access its data, Phriak raises a RiakConflictError, to indicate to the client app that it needs to resolve the siblings. 
	- The developer can then decide how to resolve the siblings (to just pick the oldest one, or to ask the user which version is correct, and so on).