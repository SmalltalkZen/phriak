adding
bucket: aString index: aString2 start: aString3 stop: aString4
	"Secondary Index input.
	See http://docs.basho.com/riak/latest/dev/references/http/secondary-indexes/#Request"

	self
		inputs:
			(RiakSecondaryIndexRangeInput new
				bucket: aString;
				index: aString2;
				start: aString3;
				end: aString4;
				yourself)