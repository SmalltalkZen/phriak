adding
reduce: aString
	self query add: (RiakMapReduceQuery new
		source: aString;
		language: 'javascript';
		type: 'reduce';
		yourself)