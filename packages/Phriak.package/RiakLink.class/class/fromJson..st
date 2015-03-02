instance creation
fromJson: json
	^self new
		bucket: (json at: 1 ifAbsent: [nil]);
		key: (json at: 2 ifAbsent: [nil]);
		tag: (json at: 3 ifAbsent: [nil]);
		yourself