operations-dev mode
devModeOnlyGetBuckets
	"Perform an HTTP List Buckets call (non-streaming, currently), and 
		instantiate the buckets.
	See http://docs.basho.com/riak/latest/dev/references/http/list-buckets/
	WARNING: Use in development only, as this is a prohibitively expensive operation."
	
	^self devModeOnlyGetBucketNames collect: [:each |
		self bucketNamed: each]