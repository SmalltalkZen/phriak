accessing
indexesAt: aString
	self indexes select: [:each | each key = aString]