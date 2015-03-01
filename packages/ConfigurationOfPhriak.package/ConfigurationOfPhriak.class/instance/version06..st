versions
version06: spec
	<version: '0.6' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec author: 'Nicolas Petton'.
			spec timestamp: '17/01/2012 12:32'.
			spec package: 'Phriak' with: 'Phriak-NicolasPetton.45'.
			spec project: 'ZincHTTPComponents' with: #stable.
			spec project: 'JSON' with: #stable ]