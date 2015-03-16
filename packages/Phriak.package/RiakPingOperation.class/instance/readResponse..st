private
readResponse: aResponse
	aResponse contents asString = 'OK'
		ifTrue: [ ^ #OK ]
		ifFalse: [ RiakNodeNotReachableError new signal: 'Cannot reach ' , self url asString ]