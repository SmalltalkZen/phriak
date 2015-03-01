tests
testMapReduce
	| artist result objects |
	
	"MapReduce to get the track titles of The Beatles"
	
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
		
	#('Two of Us' 'Dig a Pony' 'Across the Universe') do: [:each | | track |
		track := self tracksBucket newObject
			key: each;
			data: each;
			store;
			yourself.
		(self albumsBucket at: 'Let It Be') 
			linkTo: 'tracks' key: each tag: 'album';
			store].
	
	result := self client mapReduce
		bucket: 'artists' key: 'beatles';
		link: 'albums' tag: 'author';
		link: 'tracks' tag: 'album';
		map: 'function(obj) {return [obj.key];}';
		run.
	
	self assert: result sorted equals: #('Two of Us' 'Dig a Pony' 'Across the Universe') sorted