versions
version03: spec
	<version: '0.3' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec author: 'NicolasPetton'.
			spec timestamp: '15/2/2012 11:37'.
			spec package: 'Phriak' with: 'Phriak-NicolasPetton.35'.
			spec
				project: 'ZincHTTPComponents' with: #stable;
				project: 'JSON' with: #stable ]