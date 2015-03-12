testing
isDeleted
	"Is this a Tombstone object?
	See http://docs.basho.com/riak/latest/ops/advanced/deletion/#Tombstones.
	Note: You are only likely to encounter Tombstones if your delete_mode=keep in the config"

	^ self content isDeleted