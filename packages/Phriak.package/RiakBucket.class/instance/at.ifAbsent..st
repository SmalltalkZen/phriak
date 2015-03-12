public
at: aKey ifAbsent: aBlock
	"Retrieve an object at a key, if 404 Not Found, execute the block"

	^ self
		at: aKey
		object: nil
		force: false
		ifAbsent: aBlock