printing
jsonWriteOn: aStream
	^Dictionary new
		at: 'inputs' put: self inputs;
		at: 'query' put: self query;
		jsonWriteOn: aStream