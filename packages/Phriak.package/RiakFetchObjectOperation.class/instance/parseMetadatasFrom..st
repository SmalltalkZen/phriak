private
parseMetadatasFrom: aResponse
	| metadata |
	metadata := OrderedCollection new.
	aResponse headersDo: [:k :v |
		(k beginsWith: 'X-Riak-Meta-') ifTrue: [
			metadata add: (self parseMetadataFrom: k -> v)].
		].
	^metadata asDictionary