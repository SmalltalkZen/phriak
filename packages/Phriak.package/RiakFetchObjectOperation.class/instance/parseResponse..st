private
parseResponse: aResponse
	"Parse the Fetch Object response from Riak. 
	If 304 Not Modified, no need to parse the object, it's assumed that the source object is still good.
	(Otherwise, use #reloadForce:)."

	aResponse statusLine code = 304
		ifTrue: [ ^ self object ].
	^ self newObjectFromResponse: aResponse