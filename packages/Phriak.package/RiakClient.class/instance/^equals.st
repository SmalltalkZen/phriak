comparing
= aRiakClient
	"A Riak client is equal if it's of the same type, and points to the same host and port"
	
	self isHttp = aRiakClient isHttp ifFalse: [ ^false ].
	self host = aRiakClient host ifFalse: [ ^false ].
	self port = aRiakClient port ifFalse: [ ^false ].
	^true