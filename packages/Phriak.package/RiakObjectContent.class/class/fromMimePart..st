instance creation
fromMimePart: aMimePart
	| content |
	content := RiakObjectContent new
		contentType: (aMimePart headers at: 'Content-Type' ifAbsent: [ nil ]);
		etag: (aMimePart headers at: 'ETag');
		lastModified: (self parseLastModifiedFrom: aMimePart);
		indexes: (self parseIndexesFrom: aMimePart);
		metadata: (self parseMetadatasFrom: aMimePart);
		data: (aMimePart entity ifNotNil: [ :entity | entity contents ]);
		deleted: (aMimePart headers includesKey: 'X-Riak-Deleted');
		yourself.
	^ content