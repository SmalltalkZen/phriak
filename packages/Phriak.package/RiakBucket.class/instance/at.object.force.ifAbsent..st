operations
at: aKey object: aRiakObject force: forceReload ifAbsent: aBlock
	"Retrieve an object at this key. Pass along the optional RiakObject instance to provide causal context. 
	In addition, if the operation encounters a 404 Not Found, execute the optional block.
	If forceReload is true, the operation will not send an If-Not-Modified header."

	| operation |
	self validateKey: aKey forOperation: 'fetch'.
	operation := self client fetchObjectOperation
		bucket: self;
		key: aKey;
		forceReload: forceReload;
		object: aRiakObject;
		yourself.
	aBlock isNil
		ifTrue: [ ^ operation run ]
		ifFalse: [ 
			^ [ operation run ]
				on: RiakNotFoundError
				do: [ :ex | aBlock value ] ]