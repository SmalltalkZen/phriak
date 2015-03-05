initialization
initialize
	super initialize.
	self contentType: RiakObject defaultContentType.
	self indexes: OrderedCollection new.