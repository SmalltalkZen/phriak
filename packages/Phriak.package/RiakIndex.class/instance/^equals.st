comparing
= anIndex
	anIndex class == self class
		ifFalse: [ ^ false ].
	anIndex key = self key
		ifFalse: [ ^ false ].
	anIndex value = self value
		ifFalse: [ ^ false ].
	anIndex isBinary = self isBinary
		ifFalse: [ ^ false ].
	^ true