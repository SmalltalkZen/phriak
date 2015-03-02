api - dev mode
bucketNames
	"Perform an HTTP List Buckets call (non-streaming, currently).
	See http://docs.basho.com/riak/latest/dev/references/http/list-buckets/
	WARNING: Use in development only, as this is a prohibitively expensive operation."
	
	^self listBucketsOperation run