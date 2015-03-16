testing
testDeleteObject
	"This test used earlier 'list keys' (bucket keyNames) which is cached in Riak so it
	takes a while for the delete to be apparent. Instead we see if a get will fail (404).
	The API is apparently not so slick here... But now the tests are green."
	| bucket |
	bucket := self bucketForTesting.
	bucket newObject
		key: 'test';
		data: 'abc';
		store.
	bucket removeKey: 'test'.
	self should: [bucket at: 'test'] raise: RiakNotFoundError 