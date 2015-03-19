accessing - defaults
defaultObjectClass
	"Return the default class of the objects to be stored in this bucket.
	If you're going to be subclassing RiakObject with your own domain-specific objects, 
	you can also subclass RiakBucket and override #defaultObjectClass. Alternatively,
	you can change the bucket's #objectClass after instantiation:
		invoices := MyInvoicesBucket name: 'invoices' client: aRiakClient.
		invoices objectClass: MyInvoiceObject.
	"

	^ RiakObject