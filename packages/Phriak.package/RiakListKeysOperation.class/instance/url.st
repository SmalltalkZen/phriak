accessing
url
	^super url
		addPathSegment: self client bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'keys';
		queryAt: 'keys' put: 'true';
		yourself