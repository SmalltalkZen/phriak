private
parseSiblingsFor: aRiakObject from: aResponse
	"Parse the object's siblings from a multipart/mixed response from Riak"

	aRiakObject siblings: OrderedCollection new.
	aResponse entity parts do: [ :each | aRiakObject addSibling: (RiakObjectContent fromMimePart: each)  ]