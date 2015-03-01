private
parseResponse: aResponse
	^self bucket newObject
		contentType: (aResponse headers at: 'Content-Type');
		links: (self parseLinksFrom: aResponse);
		indexes: (self parseIndexesFrom: aResponse);
		metadata: (self parseMetadatasFrom: aResponse);
		key: self key; 
		data: (aResponse entity ifNotNil: [:entity | entity contents]);
		vclock: (aResponse headers at: 'X-Riak-Vclock');
		lastModified: (self parseLastModifiedFrom: aResponse);
		yourself