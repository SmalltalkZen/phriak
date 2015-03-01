accessing
url
	| url |
	url := super url
		addPathSegment: self protocol bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'keys';
		addPathSegment: self key;
		yourself.
	self vtag ifNotNil: [url queryAt: 'vtag' put: self vtag].
	^url