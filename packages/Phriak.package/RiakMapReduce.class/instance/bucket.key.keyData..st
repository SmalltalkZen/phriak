adding
bucket: aString key: aString2 keyData: aString3
	self inputs
		add:
			(RiakInput new
				bucket: aString;
				key: aString2;
				keyData: aString3;
				yourself)