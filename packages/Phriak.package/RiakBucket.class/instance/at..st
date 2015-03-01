public
at: aString
	^self protocol fetchObjectOperation 
		bucket: self;
		key: aString;
		run