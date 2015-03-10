accessing
content
	"Return the contents of the object. Raises a conflict error in case of conflicts (siblings)"

	self hasConflicts
		ifTrue: [ 
			RiakConflictError new
				object: self;
				signal: 'Riak Conflict error: attempting to retrieve contents of an object with conflicts' ]
		ifFalse: [ ^ self siblings first ]