accessing
addContextHeaderTo: headers
	(self object isNotNil and: [ self object context isNotNil ])
		ifTrue: [ headers at: 'X-Riak-Vclock' put: self object context ]