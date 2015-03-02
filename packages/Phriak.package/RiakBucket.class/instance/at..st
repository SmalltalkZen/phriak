public
at: aString
	^self client fetchObjectOperation 
		bucket: self;
		key: aString;
		run