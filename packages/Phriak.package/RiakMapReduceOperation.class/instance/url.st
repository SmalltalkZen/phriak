accessing
url
	^super url
		addPathSegment: self protocol mapreducePath;
		yourself