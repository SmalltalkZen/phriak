A RiakConflictResolver is a factory for commonly used conflict resolvers (for use with RiakAllowMultBucket and RiakAllowMultObject classes).

Sample usage:
	
	"For example, if your object has a #lastAccessed timestamp accessor:"
	usersBucket registerResolver: (RiakConflictResolver lastByTimestampMethod: #lastAccessed).