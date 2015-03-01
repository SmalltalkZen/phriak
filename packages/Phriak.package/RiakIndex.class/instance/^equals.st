comparing
= anIndex
	^anIndex class == self class and: [
		anIndex key = self key and: [
			anIndex value = self value]]