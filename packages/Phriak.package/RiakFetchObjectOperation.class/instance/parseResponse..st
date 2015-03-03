private
parseResponse: aResponse
	^self bucket newObject
		contentType: (aResponse headers at: 'Content-Type');
		indexes: (self parseIndexesFrom: aResponse);
		metadata: (self parseMetadatasFrom: aResponse);
		key: self key; 
		data: (aResponse entity ifNotNil: [:entity | entity contents]);
		context: (aResponse headers at: 'X-Riak-Vclock');
		lastModified: (self parseLastModifiedFrom: aResponse);
		yourself