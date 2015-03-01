private
readResponse: aResponse
	^(Json readFrom: aResponse contents readStream) at: 'keys'