operations
reload: aRiakObject
	"Load and return the latest version of the passed in object.
	 This is important to do before update or delete operations."

	^ self at: aRiakObject key object: aRiakObject force: false ifAbsent: nil