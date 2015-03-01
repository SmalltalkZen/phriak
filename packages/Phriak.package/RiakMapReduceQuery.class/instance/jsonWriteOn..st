printing
jsonWriteOn: aStream
	^Dictionary new
		at: self type 
		put: self attributes;
		jsonWriteOn: aStream