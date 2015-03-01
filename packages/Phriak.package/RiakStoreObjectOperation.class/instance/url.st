accessing
url
	^super url
		addPathSegment: self protocol bucketsPath;
		addPathSegment: self object bucket name;
		addPathSegment: 'keys';
		addPathSegment: self object key;
		yourself