accessing
headers
	| headers |
	headers := ZnHeaders new.
	self 
		addIndexHeadersTo: headers;
		addVClockHeaderTo: headers;
		addMetadataHeadersTo: headers.
	^headers