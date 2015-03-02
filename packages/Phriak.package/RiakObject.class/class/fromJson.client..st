instance creation
fromJson: json client: aClient
	| object values |
	json at: 'not_found' ifPresent: [^nil].
	object := self on: (aClient bucketNamed: (json at: 'bucket')).
	object
		key: (json at: 'key');
		vclock: (json at: 'vclock').
	values := (json at: 'values') first.
	object
		data: (values at: 'data');
		contentType: ((values at: 'metadata') at: 'content-type').
	((values at: 'metadata') at: 'X-Riak-Meta') ifNotNil: [:metadata |
		metadata keysAndValuesDo: [:key :value |
			object metadata at: (key allButFirst: 12) put: value]].
	((values at: 'metadata') at: 'index') ifNotNil: [:index |
		index keysAndValuesDo: [:key :value |
			object indexes add: (RiakIndex fromJson: key -> value)]].
	((values at: 'metadata') at: 'Links') ifNotNil: [:links |
		object links: (links collect: [:each | 
			RiakLink fromJson: each])].
	^object