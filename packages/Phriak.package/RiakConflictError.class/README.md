A RiakConflictError is raised when a RiakFetchObjectOperation detects the presence of multiple object versions (siblings). This is more of a signal/exception rather than an actual error, and implies that the application should resolve the multiple versions according to its domain logic.

See http://docs.basho.com/riak/latest/dev/using/conflict-resolution/ for a discussion of siblings and conflict resolution strategies.

Instance Variables
	bucket:		aRiakBucket instance
	siblings:		<Object>


