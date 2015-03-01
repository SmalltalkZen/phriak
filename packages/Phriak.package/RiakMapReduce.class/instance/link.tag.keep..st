adding
link: aBucketString tag: aString keep: aBoolean
	self query add: (RiakLinkQuery new
		bucket: aBucketString;
		tag: aString;
		keep: aBoolean;
		yourself)