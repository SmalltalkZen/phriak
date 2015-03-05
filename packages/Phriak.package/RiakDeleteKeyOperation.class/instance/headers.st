accessing
headers
	"Return the metadata/headers for the Delete operation, specifically, the causal context/vtag header."

	| headers |
	headers := ZnHeaders new.
	self addContextHeaderTo: headers.
	^ headers