public
at: aString ifAbsent: aBlock
	^[self at: aString]
		on: RiakNotFoundError 
		do: [:ex | aBlock value]