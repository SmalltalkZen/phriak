testing
testNewObject
	"Test the initial values of a new object"

	| rObject |
	rObject := RiakObject new.
	self assert: rObject bucket isNil.
	self assert: rObject key isNil.
	self assert: rObject data isNil.
	self assert: rObject context isNil.
	self assert: rObject lastModified isNil.
	self assert: rObject etag isNil.
	self assert: rObject indexes isEmpty.
	self assert: rObject metadata isEmpty.
	self assert: rObject contentType = RiakObjectContent defaultContentType.
	self assert: (rObject content isKindOf: RiakObjectContent).
	self assert: rObject siblings size = 1.
	self assert: rObject hasConflicts not.
	self assert: rObject canHaveConflicts not.
	self assert: rObject isDeleted not