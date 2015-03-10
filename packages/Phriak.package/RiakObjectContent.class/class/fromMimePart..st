instance creation
fromMimePart: aMimePart
	| content |
	content := RiakObjectContent new
		contentType: (aMimePart headers at: 'Content-Type');
		etag: (aMimePart headers at: 'ETag');
		lastModified: (self parseLastModifiedFrom: aMimePart);
		indexes: (self parseIndexesFrom: aMimePart);
		metadata: (self parseMetadatasFrom: aMimePart);
		data: (aMimePart entity ifNotNil: [ :entity | entity contents ]);
		yourself.
	^ content