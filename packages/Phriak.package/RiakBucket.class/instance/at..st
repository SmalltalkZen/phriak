public
at: aKey
	"Retrieve an object at this key"

	(aKey isNil or: [ aKey isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot fetch object, no key specified' ].
	^ self client fetchObjectOperation
		bucket: self;
		key: aKey;
		run