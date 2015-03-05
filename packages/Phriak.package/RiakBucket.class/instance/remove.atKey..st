as yet unclassified
remove: aRiakObject atKey: aKey
	"Delete the object at this key. Pass along the object to provide causal context"

	self validateKey: aKey forOperation: 'delete'.
	^ self client deleteKeyOperation
		bucket: self;
		object: aRiakObject;
		key: aKey;
		run