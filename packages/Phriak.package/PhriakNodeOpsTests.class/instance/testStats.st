testing
testStats
	| stats |
	stats := self client stats.
	self assert: (stats includesKey: 'node_gets')