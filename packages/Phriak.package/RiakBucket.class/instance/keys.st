public-development
keys
	"Only to be used in development - expensive."

	^self protocol listKeysOperation
		bucket: self;
		run