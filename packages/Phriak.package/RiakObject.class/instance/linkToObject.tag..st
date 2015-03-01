accessing
linkToObject: anObject tag: aString
	"Convenience method to link to another Riak object directly.
	See #linkTo:key:tag:"
	
	self 
		linkTo: anObject bucket name
		key: anObject key 
		tag: aString