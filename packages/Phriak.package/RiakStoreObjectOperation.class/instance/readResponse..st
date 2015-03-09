private
readResponse: aResponse
	^[self parseResponse: aResponse]
		on: Error
		do: [:ex | RiakParseError signal]