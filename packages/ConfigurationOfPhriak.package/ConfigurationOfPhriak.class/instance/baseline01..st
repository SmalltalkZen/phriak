baselines
baseline01: spec
	<version: '0.1-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://www.squeaksource.com/Phriak'.
			spec package: 'Phriak'.
			spec
				project: 'ZincHTTPComponents'
				with: [ 
					spec
						className: 'ConfigurationOfZincHTTPComponents';
						file: 'ConfigurationOfZincHTTPComponents';
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			spec
				project: 'JSON'
				with: [ 
					spec
						className: 'ConfigurationOfJSON';
						file: 'ConfigurationOfJSON';
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/JSON/main' ] ]