testing
isDeleted
	"Is this a Tombstone object content?
	See http://docs.basho.com/riak/latest/ops/advanced/deletion/#Tombstones.
	Note: You are only likely to encounter Tombstones if your delete_mode=keep in the config"

	^self deleted