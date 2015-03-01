private
parseLinkFrom: aString
	| path b k tag |
	"Links are of the following form: 
	</buckets/BUCKET/keys/KEY>; riaktag=''TAG'' "
	aString regex: '<[^>]+>' matchesDo: [:each |
		path := each allButFirst allButLast findTokens: $/].
	b := path second.
	k := path fourth.
	aString regex: 'riaktag="[^"]+"' matchesDo: [:each | 
		tag := each copyFrom: 10 to: each size - 1].
	^RiakLink bucket: b key: k tag: tag