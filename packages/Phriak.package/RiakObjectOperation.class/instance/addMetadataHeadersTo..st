accessing
addMetadataHeadersTo: headers
	self object metadata keysAndValuesDo: [:key :value |
		headers at: 'X-Riak-Meta-', key put: value]