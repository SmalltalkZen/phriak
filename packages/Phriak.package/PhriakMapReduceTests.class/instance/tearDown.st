running
tearDown
	super tearDown.
	self artistsBucket removeAll.
	self albumsBucket removeAll.
	self tracksBucket removeAll