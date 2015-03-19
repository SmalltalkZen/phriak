operations
handleConflicts
	"A regular RiakObject should not be encountering this message!
	If you've enabled multiple siblings and have conflicts, use RiakAllowMultObject,
	and register resolvers."

	RiakConflictError new
		object: self;
		signal: 'Multiple siblings encountered in a non-RiakAllowMultObject instance.'