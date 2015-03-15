comparing
= aRiakBucket
	"A Riak bucket is equal if it has the same name, client and object class.
	Note: properties is not included in the comparison to avoid multiple potential calls to Fetch Properties"
	
	self name = aRiakBucket name ifFalse: [ ^false ].
	self client = aRiakBucket client ifFalse: [ ^false ].
	self objectClass = aRiakBucket objectClass ifFalse: [ ^false ].
	^true