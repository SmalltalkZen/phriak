public
keysIndexed: aString start: aString2 end: aString3
	^self protocol secondaryIndexOperation
		bucket: self;
		key: aString;
		start: aString2
		end: aString3;
		run