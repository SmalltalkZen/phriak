validation
validateForStore: aRiakObject
	"Make sure the required object attributes are not nil or empty (for storing an object)"

	aRiakObject hasConflicts
		ifTrue: [ 
			RiakConflictError new
				object: aRiakObject;
				signal: 'Riak Conflict error: attempting to store an object with conflicts' ].
	aRiakObject contentType isNil
		ifTrue: [ 
			RiakProtocolError new
				object: aRiakObject;
				bucket: self;
				signal: 'Riak protocol error: cannot store an object wth a missing content type' ].
	aRiakObject data isNil
		ifTrue: [ 
			RiakProtocolError new
				object: aRiakObject;
				bucket: self;
				signal: 'Riak protocol error: cannot store an object wth nil data' ].