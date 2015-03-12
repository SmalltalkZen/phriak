RiakFetchObjectOperation represents a fetch object HTTP request.

In case of siblings, throws a RiakConflictError error.
See http://docs.basho.com/riak/latest/dev/references/http/fetch-object/ and
http://docs.basho.com/riak/latest/theory/concepts/context/ about causal context and sibling resolution.

Usage:
	aRiakObject := aRiakBucket at: 'key123'.
	
	aRiakObject := aRiakBucket at: 'key123' ifAbsent: [ ... ]
	
	newObject := aRiakBucket reload: aRiakObject.
	
	"Force-reload an object, do not send an If-Not-Modified header"
	newObject := aRiakBucket reloadForce: aRiakObject.
	
	"Fetch a particular version of the object, in case of siblings:"
	aRiakObject := aRiakBucket at: 'key123' vtag: aVtag. 

Instance Variables
	forceReload:	<Boolean>
	vtag:			<String>

forceReload
	- When true, do not pass in the 'If-Not-Modified' header, even if an etag is present

vtag
	- In rare cases of conflicts/siblings, you can fetch the value of a particular sibling by its vtag (version tag).
