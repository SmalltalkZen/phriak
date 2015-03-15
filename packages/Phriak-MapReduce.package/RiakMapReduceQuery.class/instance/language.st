accessing
language
	^ self attributes at: 'language' ifAbsent: [nil]