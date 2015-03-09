accessing
url
	| url |
	url := super url
		addPathSegment: self client bucketsPath;
		addPathSegment: self bucket name;
		addPathSegment: 'keys';
		yourself.
	self key isNotNil
		ifTrue: [ 
			url := url
				addPathSegment: self key;
				yourself ].
	^ url