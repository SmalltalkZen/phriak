comparing
= aRiakObject

	"Two Riak objects are equal if all of their instance variables are equal."
	self key = aRiakObject key ifFalse: [ ^false ].
	self bucket = aRiakObject bucket ifFalse: [ ^false ].
	self context = aRiakObject context ifFalse: [ ^false ].
	self siblings = aRiakObject siblings ifFalse: [ ^false ].
	^ true