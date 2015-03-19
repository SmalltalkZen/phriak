accessing
resolvers
	"Returns the registered conflict resolvers for this object. 
	Objects inherit their bucket's resolvers"

	(resolvers isEmpty and: [ self bucket isNil not ])
		ifTrue: [ ^ self bucket resolvers ].
	^ resolvers