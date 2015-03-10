parsing
parseIndexFrom: anAssociation
	|  k index binary |
	"Skip the 'X-Riak-Index-' part"
	k := anAssociation key asLowercase allButFirst: 13.
	binary := k endsWith: '_bin'.
	"Skip the '_bin' or '_int'"
	k := k allButLast: 4.
	index := RiakIndex key: k value: anAssociation value.
	index binary: binary.
	^index