private
readResponse: aResponse
	^aResponse entity ifNotNil: [:entity | entity contents]