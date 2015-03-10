testing
hasConflicts
	"Does this object have siblings? If true, it means that the object has encountered conflicts and/or
		write collisions. It is up to the developer or application to perform conflict resolution.
		See http://docs.basho.com/riak/latest/dev/using/conflict-resolution/"

	^ self siblings size > 1