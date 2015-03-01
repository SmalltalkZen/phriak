accessing
links
	"Answer the links of the receiver.
	Links are metadata that establish one-way relationships between objects in Riak. 
	Note: Links will be deprecated in future Riak versions. 
	See http://docs.basho.com/riak/latest/theory/concepts/Links/"
	
	^links ifNil: [links := OrderedCollection new]