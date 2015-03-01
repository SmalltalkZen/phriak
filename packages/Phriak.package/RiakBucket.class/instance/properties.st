public
properties
	"Read the bucket properties if not set yet.
	Answer the properties dictionary"

	^properties ifNil: [
		properties := self protocol getBucketOperation
			bucket: self;
			run]