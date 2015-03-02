accessing
baseUrl
	^ZnUrl new 
		scheme: 'http';
		host: self host;
		port: self port