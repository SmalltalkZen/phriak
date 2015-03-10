private
parseResponse: aResponse
	| rObject |
	rObject := self bucket newObject
		key: self key;
		context: (aResponse headers at: 'X-Riak-Vclock');
		yourself.
	aResponse statusLine code = 300
		ifTrue: [ self parseSiblingsFor: rObject from: aResponse ]
		ifFalse: [ rObject resetSiblingsWith: (RiakObjectContent fromMimePart: aResponse) ].
	^ rObject