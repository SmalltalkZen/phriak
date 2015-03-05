public
at: aKey put: aRiakObject
	"Store an object at a key. The passed in key is ignored at the moment, the store 
	  operation uses aRiakObject's key."

	(aKey isNil or: [ aKey isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot store object, no key specified' ].
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
	^ self client storeObjectOperation
		object:
				(aRiakObject
						bucket: self;
						yourself);
		run