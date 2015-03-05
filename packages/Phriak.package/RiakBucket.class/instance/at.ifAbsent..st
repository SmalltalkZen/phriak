public
at: aKey ifAbsent: aBlock
	"Retrieve an object at a key, if 404 Not Found, execute the block"

	(aKey isNil or: [ aKey isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot fetch object, no key specified' ].
	^ [ self at: aKey ]
		on: RiakNotFoundError
		do: [ :ex | aBlock value ]