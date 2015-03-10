parsing
parseLastModifiedFrom: aMimePart
	"Example: 
	Last-Modified: Wed, 10 Mar 2010 18:00:04 GMT"

	^ aMimePart headers headers  at: 'Last-Modified' 
		ifPresent: [ :string | TimeStamp fromString: (string allButFirst: 4) ] 
		ifAbsent: [ nil ]