versions
version08: spec
	<version: '0.8' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec author: 'Dmitri Zagidulin'.
			spec timestamp: '25/03/2015 1:25'.
			spec package: 'Phriak' with: 'Phriak-DmitriZagidulin.72'.
			spec project: 'ZincHTTPComponents' with: #stable.
			spec project: 'JSON' with: #stable ]