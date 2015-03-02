accessing
host
	"Return the hostname or ip address for the Riak endpoint"
	
	^ host ifNil: [ self class defaultHost ]