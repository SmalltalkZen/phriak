private
parseResponse: aResponse
	"Parse the Fetch Object response from Riak. 
	If 304 Not Modified, no need to parse the object, it's assumed that the source object is still good.
	(Otherwise, use #reloadForce:).
	A 300 Multiple Choice response means there are siblings to parse."

	| rObject |
	aResponse statusLine code = 304
		ifTrue: [ ^ self object ].
	rObject := self bucket newObject
		key: self key;
		context: (aResponse headers at: 'X-Riak-Vclock');
		yourself.
	aResponse statusLine code = 300
		ifTrue: [ self parseSiblingsFor: rObject from: aResponse ]
		ifFalse: [ rObject resetSiblingsWith: (RiakObjectContent fromMimePart: aResponse) ].
	^ rObject