comparing
= aRiakObjectContent
	"Two Riak object contents are equal if all of their instance variables are equal."
	
	self contentType = aRiakObjectContent contentType ifFalse: [ ^false ].
	self data = aRiakObjectContent data ifFalse: [ ^false ].
	self deleted = aRiakObjectContent deleted ifFalse: [ ^false ].
	self etag = aRiakObjectContent etag ifFalse: [ ^false ].
	self indexes = aRiakObjectContent indexes ifFalse: [ ^false ].
	self lastModified = aRiakObjectContent lastModified ifFalse: [ ^false ].
	self metadata = aRiakObjectContent metadata ifFalse: [ ^false ].
	^true