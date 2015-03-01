versions
version01: spec
	<version: '0.1' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec description: 'initial version'.
			spec author: 'NicolasPetton'.
			spec timestamp: '2/3/2012 21:05'.
			spec package: 'Phriak' with: 'Phriak-NicolasPetton.25'.
			spec
				project: 'ZincHTTPComponents' with: #stable;
				project: 'JSON' with: #stable ]