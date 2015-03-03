error handling
handleErrorResponse: aResponse

	"The object was not found."
	aResponse statusLine code = 404 ifTrue: [RiakNotFoundError signal: self key].
	
	"Uh oh...We've got siblings!"
	aResponse statusLine code = 300 ifTrue: [
		RiakConflictError new
			siblings: (self parseSiblingsFrom: aResponse);
			bucket: self bucket;
			signal]