accessing
url
	^super url
		addPathSegment: self protocol bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'props';
		yourself