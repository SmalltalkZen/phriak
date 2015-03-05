accessing
url
	^super url
		addPathSegment: self client bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'keys';
		addPathSegment: self key