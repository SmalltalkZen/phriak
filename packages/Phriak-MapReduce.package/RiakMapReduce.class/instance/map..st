adding
map: aString
	self query add: (RiakMapReduceQuery new
		source: aString;
		language: 'javascript';
		type: 'map';
		yourself)