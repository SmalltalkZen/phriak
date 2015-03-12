public
reloadForce: aRiakObject
	"Load and return the latest version of the passed in object. (Do not send an If-Not-Modified header)."

	^ self at: aRiakObject key object: aRiakObject force: true ifAbsent: nil