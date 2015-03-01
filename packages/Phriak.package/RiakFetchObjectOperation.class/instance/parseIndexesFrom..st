private
parseIndexesFrom: aResponse
	| indexes |
	indexes := OrderedCollection new.
	aResponse headersDo: [:k :v |
		(k beginsWith: 'X-Riak-Index-') ifTrue: [
			indexes add: (self parseIndexFrom: k -> v)]].
	^indexes