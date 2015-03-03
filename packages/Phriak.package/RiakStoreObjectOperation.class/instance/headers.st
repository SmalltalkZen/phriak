accessing
headers
	| headers |
	headers := ZnHeaders new.
	self 
		addIndexHeadersTo: headers;
		addContextHeaderTo: headers;
		addMetadataHeadersTo: headers.
	^headers