public-development
keys
	"Only to be used in development - expensive."

	^self client listKeysOperation
		bucket: self;
		run