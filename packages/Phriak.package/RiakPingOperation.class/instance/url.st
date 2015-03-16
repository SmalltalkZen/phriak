private
url
	^super url
		addPathSegment: 'ping';
		yourself