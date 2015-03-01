accessing
addVClockHeaderTo: headers
	self object vclock ifNotNil: [
		headers at: 'X-Riak-Vclock' put: self object vclock]