parsing
parseMetadataFrom: anAssociation
	|  k |
	"Skip the 'X-Riak-Meta-' part"
	k := anAssociation key asLowercase allButFirst: 12.
	^Association key: k value: anAssociation value