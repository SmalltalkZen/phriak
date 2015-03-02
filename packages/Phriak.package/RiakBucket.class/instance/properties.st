public
properties
	"Read the bucket properties if not set yet.
	Answer the properties dictionary"

	^properties ifNil: [
		properties := self client getBucketOperation
			bucket: self;
			run]