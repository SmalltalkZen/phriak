tests
testLinkWalking
	| artist result objects |
	
	artist := self artistsBucket newObject
		key: 'beatles';
		data: 'The Beatles';
		store;
		yourself.
		
	#('Please Please Me' 'With The Beatles' 'The Beatles' 'Let It Be') do: [:each | | album |
		album := self albumsBucket newObject
			key: each;
			data: each;
			indexesAt: 'hello' put: 'world';
			store;
			yourself.
		artist 
			linkTo: 'albums' key: each tag: 'author';
			store].
	
	artist := self artistsBucket newObject
		key: 'pink floyd';
		data: 'Pink Floyd';
		store;
		yourself.
		
	#('Atom Heart Mother' 'Have A Cigar' 'The Dark Side Of The Moon') do: [:each | | album |
		album := self albumsBucket newObject
			key: each;
			data: each;
			store;
			yourself.
		artist 
			linkTo: 'albums' key: each tag: 'author';
			store].
	
	result := self client mapReduce
		bucket: 'artists' key: 'beatles';
		link: 'albums' tag: 'author';
		mapDefault;
		run.
	
	self assert: result size = 4.
	
	objects  := result collect: [:each | 
		RiakObject fromJson: each client: self client].
	
	self assert: (objects collect: [:each | each key]) sorted equals: #('Please Please Me' 'With The Beatles' 'The Beatles' 'Let It Be') sorted