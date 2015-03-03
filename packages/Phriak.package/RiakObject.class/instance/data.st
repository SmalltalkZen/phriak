accessing
data
	"Riak is content-angostic. 
	The data can be a String (from JSON for example) or a binary object (ByteArray)"

	self hasConflicts
		ifTrue: [ 
			RiakConflictError new
				object: self;
				signal: 'Riak Conflict error: attempting to retrieve data of an object with conflicts' ]
		ifFalse: [ ^ data ]