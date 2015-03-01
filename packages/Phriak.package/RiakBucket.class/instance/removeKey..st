public
removeKey: key
	^ self protocol deleteKeyOperation
		bucket: self;
		key: key;
		run