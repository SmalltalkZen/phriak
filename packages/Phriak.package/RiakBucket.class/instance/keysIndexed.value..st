public
keysIndexed: aString value: anotherString
	^self client secondaryIndexOperation
		bucket: self;
		key: aString;
		value: anotherString;
		run