accessing
addLinksHeaderTo: headers
	self object links isEmpty ifFalse: [
		headers at: 'Link' put: (String streamContents: [:str |
			self object links 
				do: [:each | str nextPutAll: '</', self client bucketsPath,'/', each bucket, '/keys/', each key, '>; riaktag="', each tag, '"']
				separatedBy: [str nextPut: $,]])]