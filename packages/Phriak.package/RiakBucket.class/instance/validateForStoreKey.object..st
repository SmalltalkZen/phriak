as yet unclassified
validateForStoreKey: aKey object: aRiakObject
	"Make sure the key and required object attributes are not nil or empty (for storing an object)"

	self validateKey: aKey forOperation: 'store'.

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