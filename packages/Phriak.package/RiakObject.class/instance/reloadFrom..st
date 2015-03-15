accessing
reloadFrom: aRiakObject
	"Reload the relevant attributes of this object from another Riak object.
	Used for #reload and #store (with returnbody=true)"

	self bucket: aRiakObject bucket.
	self context: aRiakObject context.
	self siblings: aRiakObject siblings