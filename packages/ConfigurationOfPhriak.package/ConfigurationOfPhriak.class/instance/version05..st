versions
version05: spec
	<version: '0.5' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec author: 'Paul DeBruicker'.
			spec timestamp: '11/9/2012 9:44'.
			spec package: 'Phriak' with: 'Phriak-PaulDeBruicker.44'.
			spec
				project: 'ZincHTTPComponents' with: #stable;
				project: 'JSON' with: #stable ]