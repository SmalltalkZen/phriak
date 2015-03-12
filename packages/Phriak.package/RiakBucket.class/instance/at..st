public
at: aKey
	"Retrieve an object at this key"

	^ self
		at: aKey
		object: nil
		force: false
		ifAbsent: nil