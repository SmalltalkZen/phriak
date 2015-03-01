versions
version02: spec
	<version: '0.2' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec author: 'NicolasPetton'.
			spec timestamp: '2/4/2012 22:05'.
			spec package: 'Phriak' with: 'Phriak-NicolasPetton.30'.
			spec
				project: 'ZincHTTPComponents' with: #stable;
				project: 'JSON' with: #stable ]