accessing
addContextHeaderTo: headers
	self object context ifNotNil: [
		headers at: 'X-Riak-Vclock' put: self object context]