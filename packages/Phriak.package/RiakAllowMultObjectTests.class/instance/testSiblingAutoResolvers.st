testing
testSiblingAutoResolvers
	"If you have enabled siblings on a bucket, you can register automatic resolvers.
	When an object with siblings attempts to access its contents, these resolvers get called,
	in order."

	| bucket objectWithSiblings |
	bucket := RiakClient default allowMultBucketNamed: 'test-allow-mult-bucket'.
	bucket registerResolver: self resolverForTesting.
	objectWithSiblings := bucket newObject
		siblings: OrderedCollection new;
		yourself.
	objectWithSiblings
		addSibling:
			(RiakObjectContent new
				data: 'value1';
				yourself);
		addSibling:
			(RiakObjectContent new
				data: 'value2';
				yourself).
	self assert: objectWithSiblings hasConflicts.
	self assert: objectWithSiblings siblings size = 2.
	"Accessing #content triggers the registered resolvers"
	self shouldnt: [ objectWithSiblings content ] raise: RiakConflictError description: 'Objects with resolvers should not raise RiakConflictError'.
	self deny: objectWithSiblings hasConflicts description: 'Resolvers triggered on an object should resolve all conflicts automatically'.
	self assert: objectWithSiblings siblings size = 1.
	
	