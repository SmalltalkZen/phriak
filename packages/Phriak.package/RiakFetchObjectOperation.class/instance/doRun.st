private
doRun
	"Assemble the request and perform the Fetch Object operation"

	| znClient |
	znClient := self httpClient
		url: self url;
		yourself.
	self addHeadersTo: znClient.
	^ znClient get