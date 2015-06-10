operations
initProperties
	"Set the allow_mult bucket properties. Should only be run once (think of a create table call)"

	self properties
		at: 'allow_mult' put: true;
		at: 'last_write_wins' put: true;
		at: 'dvv_enabled' put: true.
	self storeProperties