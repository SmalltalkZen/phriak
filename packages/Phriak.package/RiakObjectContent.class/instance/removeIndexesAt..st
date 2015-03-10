accessing
removeIndexesAt: aString
	self indexes: (self indexes reject: [:each | each key = aString])