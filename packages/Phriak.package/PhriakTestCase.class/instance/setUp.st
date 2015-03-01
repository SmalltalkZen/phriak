running
setUp
	super setUp.
	self client: RiakSession default.
	self bucketForTesting removeAll