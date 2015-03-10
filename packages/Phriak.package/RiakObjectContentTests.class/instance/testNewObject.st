testing
testNewObject
	"Test the initial values of a new object"

	| content |
	content := RiakObjectContent new.
	self assert: content data isNil.
	self assert: content lastModified isNil.
	self assert: content etag isNil.
	self assert: content indexes isEmpty.
	self assert: (content indexes isKindOf: OrderedCollection).
	self assert: content metadata isEmpty.
	self assert: (content metadata isKindOf: Dictionary).
	self assert: content contentType = RiakObjectContent defaultContentType