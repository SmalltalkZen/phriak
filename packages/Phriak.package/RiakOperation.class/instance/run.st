running
run
	
	self doRun.
	(self successfulResponseCodes includes: self httpTransportClient response statusLine code)
		ifFalse: [ 
			(self errorResponseCodes includes: self httpTransportClient response statusLine code)
				ifTrue: [ ^ self handleErrorResponse: self httpTransportClient response ].
			self responseError: self httpTransportClient response entity contents ].
	^ self readResponse: self httpTransportClient response