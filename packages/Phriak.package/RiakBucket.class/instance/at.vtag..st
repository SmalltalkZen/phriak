public
at: aString vtag: aString2
	^self client fetchObjectOperation 
		bucket: self;
		key: aString;
		vtag: aString2;
		run