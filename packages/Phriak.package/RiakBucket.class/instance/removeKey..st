public
removeKey: aKey
	"Delete the object at this key. Highly recommended to read-before-delete, to load fresh context"

	(aKey isNil or: [ aKey isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot delete object, no key specified' ].
	^ self client deleteKeyOperation
		bucket: self;
		key: aKey;
		run