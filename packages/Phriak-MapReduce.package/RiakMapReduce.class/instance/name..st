adding
name: aString
	"use one of Riaks built in JS funcitons"

	self query
		add:
			(RiakMapReduceQuery new
				name: aString;
				language: 'javascript';
				type: 'map';
				yourself)