private
successfulResponseCodes
	"Return the HTTP codes supported and considered successful by the Fetch Object operation. An 'HTTP 300 Multiple Choices' response means that conflicts/siblings were encountered. "
	
	^#(200 300)