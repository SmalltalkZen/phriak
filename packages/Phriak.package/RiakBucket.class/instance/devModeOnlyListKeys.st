operations-dev mode
devModeOnlyListKeys
	"Only to be used in development - expensive. 
	Iterates through every key in the cluster (not just in the bucket)."

	^self client devModeOnlyListKeysOperation
		bucket: self;
		run