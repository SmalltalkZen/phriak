creation
lastByTimestampMethod: aTimestampMethod
	"Return a resolver block that picks the object's sibling with the oldest timestamp (via the specified accessor method).
	Usage (if your object has a #lastAccessed timestamp accessor):
	
	usersBucket registerResolver: (RiakConflictResolver lastByTimestampMethod: #lastAccessed).
	"

	^ [ :robj | robj siblings max: aTimestampMethod ]