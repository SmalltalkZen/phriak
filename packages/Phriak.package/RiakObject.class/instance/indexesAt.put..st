accessing
indexesAt: aString put: aString2
	self indexes add: (RiakIndex key: aString value: aString2)