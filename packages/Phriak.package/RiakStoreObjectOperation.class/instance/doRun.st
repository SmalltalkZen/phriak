executing
doRun
	| znClient |
	znClient := self httpTransportClient
		headerAddAll: self headers;
		url: self url;
		entity: (ZnEntity with: self object data type: self object contentType);
		yourself.
	self key isNil
		ifTrue: [ ^ znClient post ]
		ifFalse: [ ^ znClient put ]