accessing
url
	^super url
		addPathSegment: self protocol bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'keys';
		addPathSegment: self key