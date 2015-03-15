accessing
url
	| url |
	url := super url.
	url queryAt: 'returnbody' add: 'true'.
	^ url