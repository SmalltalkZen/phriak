accessing
metadata
	"Answer user defined metadata"
	
	^metadata ifNil: [metadata := JsonObject new]