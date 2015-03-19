accessing - defaults
defaultObjectClass
	"Return the default class of the objects to be stored in this bucket.
	If you're going to be subclassing RiakAllowMultObject with your own domain-specific objects, 
	you can also subclass RiakAllowMultBucket and override #defaultObjectClass. Alternatively,
	you can change the bucket's #objectClass after instantiation:
		contacts := MyUserContactsBucket name: 'user_contacts' client: aRiakClient.
		contacts objectClass: MyUserContactObject.
	"

	^ RiakAllowMultObject