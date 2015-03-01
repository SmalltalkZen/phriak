accessing
linkTo: aString key: aString2 tag: aString3
	"Links are metadata that establish one-way relationships between objects in Riak. 
	Note: Links will be deprecated in future Riak versions. 
	See http://docs.basho.com/riak/latest/theory/concepts/Links/
	
	Add a link to an object inside a bucket named aString with the key aString2 and tagged as aString3"
	
	self links add: (RiakLink bucket: aString key: aString2 tag: aString3)