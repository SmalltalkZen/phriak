accessing
url
	| url |
	url := super url.
	self vtag ifNotNil: [url queryAt: 'vtag' put: self vtag].
	^url