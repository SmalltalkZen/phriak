printing
jsonWriteOn: aStream
	| query |
	query := Dictionary new.
	self bucket ifNotNil: [query at: 'bucket' put: self bucket].
	self tag ifNotNil: [query at: 'tag' put: self tag].
	self keep ifNotNil: [query at: 'keep' put: self keep].
	Dictionary new 
		at: 'link' put: query;
		jsonWriteOn: aStream