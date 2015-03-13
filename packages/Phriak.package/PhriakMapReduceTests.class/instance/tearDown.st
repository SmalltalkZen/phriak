running
tearDown
	super tearDown.
	self artistsBucket devModeOnlyRemoveAll.
	self albumsBucket devModeOnlyRemoveAll.
	self tracksBucket devModeOnlyRemoveAll