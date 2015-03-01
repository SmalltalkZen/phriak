public
at: aString put: aRiakObject

	^ self protocol storeObjectOperation
		object: (aRiakObject
			bucket: self;
			yourself);
		run