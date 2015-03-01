accessing
module
	^ self attributes at: 'module' ifAbsent: [nil]