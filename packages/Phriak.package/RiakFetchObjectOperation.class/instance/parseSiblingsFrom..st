private
parseSiblingsFrom: aResponse
	"This is quite hackish. Unfortunately, Zinc doesn't parse multipart/mixed entities yet, so we can't get all siblings at once.
	
	The response body is like the following:

	Siblings:
	16vic4eU9ny46o4KPiDz1f
	4v5xOg4bVwUYZdMkqf0d6I
	6nr5tDTmhxnwuAFJDd2s6G
	6zRSZFUJlHXZ15o9CG0BYl
	
	See: http://docs.basho.com/riak/latest/theory/concepts/Vector-Clocks/ for more
	about siblings"
	
	^((aResponse entity contents copyWithRegex: 'Siblings\:' matchesReplacedWith: '')
		findTokens: Character lf)
			select: [:each | each notEmpty]