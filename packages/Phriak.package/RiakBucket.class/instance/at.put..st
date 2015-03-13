public
at: aKey put: aRiakObject
	"Store an object at a key. The passed in key is ignored at the moment, the store 
	  operation uses aRiakObject's key."

	self validateForStore: aRiakObject.
	^ self client storeObjectOperation
		key: aKey;
		bucket: self;
		object: aRiakObject;
		run