running
doRun
	^self httpTransportClient
		url: self url;
		headerAddAll: (ZnHeaders withAll: {'Content-Type' -> 'application/json'} asDictionary);
		entity: (ZnEntity 
			with: (Dictionary new 
				at: 'props' 
				put: self bucket properties; yourself) asJsonString
			type: 'application/json');
		put