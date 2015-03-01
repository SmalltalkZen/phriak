accessing
addIndexHeadersTo: header
	header addAll: (self object indexes collect: [:each || indexKey |
		indexKey := each isBinary ifTrue: [each key, '_bin'] ifFalse: [each key, '_int'].
		('x-riak-index-', indexKey) -> each value]) asDictionary