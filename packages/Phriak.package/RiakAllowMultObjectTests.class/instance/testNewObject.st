testing
testNewObject
	"Test the initial values of a new object"

	| rObject |
	rObject := RiakAllowMultObject new.
	self assert: rObject canHaveConflicts.
	self assert: rObject hasConflicts not.
	self assert: rObject resolvers isEmpty.
	