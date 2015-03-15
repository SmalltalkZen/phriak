persistence
store
	"Store the receiver object in its Riak bucket, and refresh (context, potential siblings created, etc) from the response.
	If the object has conflicts (siblings), signal a conflict error instead of storing."

	self bucket isNil
		ifTrue: [ 
			RiakProtocolError new
				object: self;
				signal: 'Riak protocol error: cannot store an object with no bucket specified' ].
	self bucket at: self key put: self