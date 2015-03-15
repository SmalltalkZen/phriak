printing
jsonWriteOn: aStream
	self key
		ifNil: [ self bucket jsonWriteOn: aStream ]
		ifNotNil: [ 
			(self keyData
				ifNil: [ 
					{(self bucket).
					(self key)} ]
				ifNotNil: [ 
					{(self bucket).
					(self key).
					(self keyData)} ]) jsonWriteOn: aStream ]