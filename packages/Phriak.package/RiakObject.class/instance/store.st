actions
store
	"Store the receiver object in its Riak bucket. If the object has conflicts (siblings), signal a conflict error instead of storing."

	self hasConflicts
		ifTrue: [ 
			RiakConflictError new
				object: self;
				signal: 'Riak Conflict error: attempting to store an object with conflicts' ]
		ifFalse: [ self bucket at: self key put: self ]