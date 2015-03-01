instance creation
name: aString session: aSession
	^ self new
		session: aSession;
		name: aString;
		yourself