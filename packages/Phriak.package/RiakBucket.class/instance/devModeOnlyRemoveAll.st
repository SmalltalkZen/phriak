operations-dev mode
devModeOnlyRemoveAll
	"Only to be used in development - expensive."

	self devModeOnlyListKeys do: [:each | self removeKey: each]