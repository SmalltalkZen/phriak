private
readResponse: aResponse
	^Json readFrom: aResponse entity contents readStream