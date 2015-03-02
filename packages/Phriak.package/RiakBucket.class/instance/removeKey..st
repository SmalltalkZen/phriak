public
removeKey: key
	^ self client deleteKeyOperation
		bucket: self;
		key: key;
		run