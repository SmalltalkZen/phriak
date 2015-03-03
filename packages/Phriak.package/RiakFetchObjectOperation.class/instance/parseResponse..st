private
parseResponse: aResponse
	| object |
	object := self bucket newObject
		contentType: (aResponse headers at: 'Content-Type');
		indexes: (self parseIndexesFrom: aResponse);
		metadata: (self parseMetadatasFrom: aResponse);
		key: self key;
		context: (aResponse headers at: 'X-Riak-Vclock');
		lastModified: (self parseLastModifiedFrom: aResponse);
		yourself.
	aResponse statusLine code = 300
		ifTrue: [ object siblingTags: (self parseSiblingTagsFrom: aResponse) asOrderedCollection ]
		ifFalse: [ object data: (aResponse entity ifNotNil: [ :entity | entity contents ]) ].
	^ object