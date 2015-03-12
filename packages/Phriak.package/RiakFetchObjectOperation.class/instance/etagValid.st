testing
etagValid
	"Does this operation have access to a valid object ETag?"

	^ self object isNil not and: [ object etag isNil not ]