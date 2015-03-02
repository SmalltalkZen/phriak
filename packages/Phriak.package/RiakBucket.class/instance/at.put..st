public
at: aString put: aRiakObject

	^ self client storeObjectOperation
		object: (aRiakObject
			bucket: self;
			yourself);
		run