public-development
keys
	"Only to be used in development - expensive. 
	Iterates through every key in the cluster (not just in the bucket)."

	^self client listKeysOperation
		bucket: self;
		run