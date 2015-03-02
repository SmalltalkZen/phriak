accessing
url
	| url |
	url := super url
		addPathSegment: self client bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'index';
		addPathSegment: self key, (self binary 
			ifTrue: ['_bin'] ifFalse: ['_int']);
		yourself.
	self value 
		ifNil: [url addPathSegment: self start; addPathSegment: self end]
		ifNotNil: [url addPathSegment: self  value].
	^url