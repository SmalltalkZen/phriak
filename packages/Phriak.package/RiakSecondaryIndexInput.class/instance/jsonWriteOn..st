as yet unclassified
jsonWriteOn: aStream
	| size |
	size := self jsonValueArray size.
	aStream nextPut: ${.
	self jsonValueArray
		doWithIndex: [ :each :idx | 
			each jsonWriteOn: aStream.
			idx = size
				ifFalse: [ aStream nextPut: $, ] ].
	aStream nextPut: $}