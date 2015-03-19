operations
handleConflicts
	"If the object has resolvers registered, invoke them until they either succeed in choosing a single correct value
		out of the siblings, or we run out of resolvers. Trigger a conflict error, otherwise."

	(self resolvers anySatisfy: [ :each | self resolveSiblingsWith: each ])
		ifFalse: [ 
			RiakConflictError new
				object: self;
				signal: 'Multiple siblings encountered, unable to automatically resolve' ]