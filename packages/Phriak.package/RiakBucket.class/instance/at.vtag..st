public
at: aKey vtag: aVtagString
	"Fetch an object at a particular 'version tag'. Used when there are siblings / multiple versions present."
		(aKey isNil or: [ aKey isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot fetch object, no key specified' ].
		(aVtagString isNil or: [ aVtagString isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot fetch object at this vtag, no vtag specified' ].
	^self client fetchObjectOperation 
		bucket: self;
		key: aKey;
		vtag: aVtagString;
		run