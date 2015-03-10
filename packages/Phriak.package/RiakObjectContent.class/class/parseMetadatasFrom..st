parsing
parseMetadatasFrom: aMimePart
	| metadata |
	metadata := OrderedCollection new.
	aMimePart headersDo: [:k :v |
		(k beginsWith: 'X-Riak-Meta-') ifTrue: [
			metadata add: (self parseMetadataFrom: k -> v)]].
	^metadata asDictionary