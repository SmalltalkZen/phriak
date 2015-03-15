executing
doRun
	^self httpTransportClient 
		url: self url;
		headerAddAll: (ZnHeaders withAll: {'Content-Type' -> 'application/json'} asDictionary);
		entity: (ZnEntity with: self mapReduce asJsonString type: 'application/json');
		post