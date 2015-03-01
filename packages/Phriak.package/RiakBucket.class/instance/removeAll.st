public-development
removeAll
	"Only to be used in development - expensive."

	self keys do: [:each | self removeKey: each]