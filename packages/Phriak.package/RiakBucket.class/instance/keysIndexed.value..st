public
keysIndexed: aString value: anotherString
	^self protocol secondaryIndexOperation
		bucket: self;
		key: aString;
		value: anotherString;
		run