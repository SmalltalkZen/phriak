private
successfulResponseCodes
	"Return the HTTP codes supported and considered successful by the Fetch Object operation. 
	An 'HTTP 300 Multiple Choices' response means that conflicts/siblings were encountered. 
	Since the Fetch operation typically sends a 'If-Not-Modified' header (if an etag is available), 
	an HTTP 304 Not Modified result is also a success (in which case, just return the original objet)."
	
	^#(200 300 304)