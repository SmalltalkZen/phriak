running
doRun
	"Execute a request"
	^self httpTransportClient get: self url