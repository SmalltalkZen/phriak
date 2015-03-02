RiakFetchObjectOperation represents a fetch object HTTP request.

In case of siblings, throws a RiakConflictError error.

See http://docs.basho.com/riak/latest/dev/references/http/fetch-object/ and
http://docs.basho.com/riak/latest/theory/concepts/Vector-Clocks/ about siblings and vector clocks

Usage:
	aRiakObject := aRiakBucket at: 'key123'.
	
	aRiakObject := aRiakBucket at: 'key123' ifAbsent: [ ... ]
	
	"Fetch a particular version of the object, in case of siblings:"
	aRiakObject := aRiakBucket at: 'key123' vtag: aVtag. 