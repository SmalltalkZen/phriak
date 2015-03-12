initialization
initialize
	super initialize.
	self contentType: RiakObjectContent defaultContentType.
	self indexes: OrderedCollection new.
	self metadata: Dictionary new.
	self deleted: false.