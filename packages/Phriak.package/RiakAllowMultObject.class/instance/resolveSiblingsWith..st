operations
resolveSiblingsWith: aResolverBlock
	"Invoke a sibling resolver block, and return whether or not it has solved the multiple siblings conflict"
	| correctSibling |

	correctSibling := aResolverBlock value: self.
	correctSibling isNil
		ifFalse: [ self resetSiblingsWith: correctSibling ].
	^ self hasConflicts not