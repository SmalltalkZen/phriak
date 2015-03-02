accessing
url
	^super url
		addPathSegment: self client mapReducePath;
		yourself