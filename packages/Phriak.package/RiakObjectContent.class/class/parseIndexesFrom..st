parsing
parseIndexesFrom: aMimePart
	| indexes |
	indexes := OrderedCollection new.
	aMimePart headersDo: [:k :v |
		(k beginsWith: 'X-Riak-Index-') ifTrue: [
			indexes add: (self parseIndexFrom: k -> v)]].
	^indexes