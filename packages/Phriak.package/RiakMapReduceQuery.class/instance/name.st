accessing
name
	^ self attributes at: 'name' ifAbsent: [nil]