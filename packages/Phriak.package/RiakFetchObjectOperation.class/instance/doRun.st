private
doRun
	"Assemble the request and perform the Fetch Object operation"

	| znClient |
	znClient := self httpTransportClient
		url: self url;
		yourself.
	self addHeadersTo: znClient.
	^ znClient get