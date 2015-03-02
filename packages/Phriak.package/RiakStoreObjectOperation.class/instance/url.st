accessing
url
	^super url
		addPathSegment: self client bucketsPath;
		addPathSegment: self object bucket name;
		addPathSegment: 'keys';
		addPathSegment: self object key;
		yourself