public
at: aKey put: aRiakObject
	"Store an object at a key. The passed in key is ignored at the moment, the store 
	  operation uses aRiakObject's key."
	
	^ self client storeObjectOperation
		object: (aRiakObject
			bucket: self;
			yourself);
		run