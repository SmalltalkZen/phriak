adding
bucket: aString index: aString2 key: aString3
	"Secondary Index input.
	See http://docs.basho.com/riak/latest/dev/references/http/secondary-indexes/#Request"

	self
		inputs:
			(RiakSecondaryIndexInput new
				bucket: aString;
				index: aString2;
				key: aString3;
				yourself)