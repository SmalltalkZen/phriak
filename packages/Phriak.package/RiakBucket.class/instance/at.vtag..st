public
at: aKey vtag: aString
	"Fetch an object at a particular 'version tag'. Used when there are siblings / multiple versions present."
	
	^self client fetchObjectOperation 
		bucket: self;
		key: aKey;
		vtag: aString;
		run