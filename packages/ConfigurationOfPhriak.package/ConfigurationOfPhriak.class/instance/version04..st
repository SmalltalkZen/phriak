versions
version04: spec
	<version: '0.4' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec author: 'Paul DeBruicker'.
			spec timestamp: '20/4/2012 15:37'.
			spec package: 'Phriak' with: 'Phriak-PaulDeBruicker.42'.
			spec
				project: 'ZincHTTPComponents' with: #stable;
				project: 'JSON' with: #stable ]