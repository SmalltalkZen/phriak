versions
version07: spec
	<version: '0.7' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec author: 'Dmitri Zagidulin'.
			spec timestamp: '13/03/2014 21:25'.
			spec package: 'Phriak' with: 'Phriak-DmitriZagidulin.49'.
			spec project: 'ZincHTTPComponents' with: #stable.
			spec project: 'JSON' with: #stable ]