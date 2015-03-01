error handling
handleErrorResponse: aResponse
	"Handle expected error responses.
	see #errorResponseCodes"
	
	RiakProtocolError signal: aResponse entity contents