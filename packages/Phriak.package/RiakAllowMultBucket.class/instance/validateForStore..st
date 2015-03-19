validation
validateForStore: aRiakObject
	"Make sure the required object attributes are not nil or empty (for storing an object)"

	(super validateForStore: aRiakObject)
		ifFalse: [ ^ false ].
	aRiakObject hasConflicts
		ifTrue: [ 
			RiakConflictError new
				object: aRiakObject;
				signal: 'Riak Conflict error: attempting to store an object with conflicts' ].
	^ true