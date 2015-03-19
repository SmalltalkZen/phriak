accessing
content
	"Return the contents of the object. Raises a conflict error in case of conflicts (siblings)"

	self hasConflicts
		ifTrue: [ self handleConflicts ].
	^ self siblings first