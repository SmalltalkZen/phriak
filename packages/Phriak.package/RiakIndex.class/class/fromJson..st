instance creation
fromJson: json
	| index key |
	key := json key allButLast: 4.
	index := self key: key value: json value.
	index binary: (json key endsWith: '_bin').
	^index