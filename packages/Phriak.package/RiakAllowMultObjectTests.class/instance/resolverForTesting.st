accessing
resolverForTesting
	"Dummy conflict resolver - picks a sibling at random"

	^ [ :robj | robj siblings anyOne ]