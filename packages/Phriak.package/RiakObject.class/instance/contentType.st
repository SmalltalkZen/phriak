accessing
contentType
	"The MIME content-type of the receiver's data"
	
	^contentType ifNil: ['application/json']