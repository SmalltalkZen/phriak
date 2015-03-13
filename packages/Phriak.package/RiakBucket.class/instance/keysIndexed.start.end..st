operations
keysIndexed: aString start: aString2 end: aString3
	^self client secondaryIndexOperation
		bucket: self;
		key: aString;
		start: aString2
		end: aString3;
		run