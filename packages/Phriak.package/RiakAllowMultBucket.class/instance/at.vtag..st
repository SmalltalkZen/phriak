operations
at: aKey vtag: aVtagString
	"Fetch an object at a particular 'version tag'. This is not currently very useful, since -all- of an object's siblings are normally fetched. Leaving it here just in case."

	self validateKey: aKey forOperation: 'fetch'.
	(aVtagString isNil or: [ aVtagString isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot fetch object at this vtag, no vtag specified' ].
	^ self client fetchObjectOperation
		bucket: self;
		key: aKey;
		forceReload: true;
		vtag: aVtagString;
		run