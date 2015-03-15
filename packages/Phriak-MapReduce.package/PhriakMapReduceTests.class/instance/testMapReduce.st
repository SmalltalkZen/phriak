tests
testMapReduce
	| artist   |
	
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
			yourself].
		
	#('Two of Us' 'Dig a Pony' 'Across the Universe') do: [:each | | track |
		track := self tracksBucket newObject
			key: each;
			data: each;
			store;
			yourself].