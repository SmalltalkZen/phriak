initialization
initialize
	super initialize.
	self host: self class defaultHost.
	self port: self class defaultHttpPort.