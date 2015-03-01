public
at: aString vtag: aString2
	^self protocol fetchObjectOperation 
		bucket: self;
		key: aString;
		vtag: aString2;
		run