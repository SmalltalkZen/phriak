accessing
source
	^ self attributes at: 'source' ifAbsent: [nil]