private
parseResponse: aResponse
	|   rObject  |
	rObject := self bucket newObject
		contentType: (aResponse headers at: 'Content-Type');
		indexes: (self parseIndexesFrom: aResponse);
		metadata: (self parseMetadatasFrom: aResponse);
		key: self key;
		context: (aResponse headers at: 'X-Riak-Vclock');
		etag: (aResponse headers at: 'ETag');
		lastModified: (self parseLastModifiedFrom: aResponse);
		yourself.
	aResponse statusLine code = 300
		ifTrue: [ rObject siblingTags: (self parseSiblingTagsFrom: aResponse) asOrderedCollection ]
		ifFalse: [ rObject data: (aResponse entity ifNotNil: [ :entity | entity contents ]) ].
	^ rObject