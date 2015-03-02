accessing
url
	^super url
		addPathSegment: self client bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'props';
		yourself