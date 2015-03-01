comparing
= aLink
	^aLink class == self class and: [
		aLink bucket = self bucket and: [
			aLink key = self key and: [
				aLink tag = self tag]]]