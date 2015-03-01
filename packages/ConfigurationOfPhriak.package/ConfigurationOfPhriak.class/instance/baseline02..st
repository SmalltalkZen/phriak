baselines
baseline02: spec
	<version: '0.2-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://www.smalltalkhub.com/mc/gokr/Phriak/main'.
			spec
				project: 'ZincHTTPComponents'
				with: [ 
					spec
						className: 'ConfigurationOfZincHTTPComponents';
						file: 'ConfigurationOfZincHTTPComponents';
						repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
			spec
				project: 'JSON'
				with: [ 
					spec
						className: 'ConfigurationOfJSON';
						file: 'ConfigurationOfJSON';
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/JSON/main' ].
			spec package: 'Phriak' with: [ spec requires: #('ZincHTTPComponents' 'JSON') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('Phriak') ]