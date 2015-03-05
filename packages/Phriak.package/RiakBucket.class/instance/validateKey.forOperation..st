validation
validateKey: aKey forOperation: anOperationName
	"Make sure the key is not nil or empty (for fetching or storing an object)"

	(aKey isNil or: [ aKey isEmpty ])
		ifTrue: [ 
			RiakProtocolError new
				bucket: self;
				signal: 'Riak protocol error: cannot ' , anOperationName , ' object, no key specified' ]