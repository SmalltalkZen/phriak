error handling
handleErrorResponse: aResponse

	"The object was not found."
	aResponse statusLine code = 404 ifTrue: [RiakNotFoundError signal: self key].