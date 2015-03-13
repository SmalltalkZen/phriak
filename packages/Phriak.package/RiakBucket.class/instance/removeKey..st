operations
removeKey: aKey
	"Delete the object at this key. Highly recommended to read-before-delete, to load fresh context, and use >>#remove:atKey: instead"

	^ self remove: nil atKey: aKey