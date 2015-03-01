accessing
headers
	| headers |
	headers := ZnHeaders new.
	self 
		addIndexHeadersTo: headers;
		addLinksHeaderTo: headers;
		addVClockHeaderTo: headers;
		addMetadataHeadersTo: headers.
	^headers