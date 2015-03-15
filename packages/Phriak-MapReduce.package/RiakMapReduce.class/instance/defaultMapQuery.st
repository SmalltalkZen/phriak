defaults
defaultMapQuery
	^RiakMapReduceQuery new
		type: 'map';
		source: 'function(v){return [v];}';
		language: 'javascript';
		yourself