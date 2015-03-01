private
parseLinksFrom: aResponse
	| links |
	links := aResponse headers at: 'Link' ifAbsent: [^nil].
	^((links findTokens: ',')
		select: [:each | each includesSubstring: 'riaktag'])
		collect: [:each | self parseLinkFrom: each]