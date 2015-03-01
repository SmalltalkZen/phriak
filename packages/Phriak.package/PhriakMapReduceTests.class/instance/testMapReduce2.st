tests
testMapReduce2
	| result expected |
	"See http://docs.basho.com/riak/latest/dev/references/http/mapreduce/"
	
	self bucketForTesting newObject
		key: 'p1';
		data: 'Alice was beginning to get very tired of sitting by her sister on the
bank, and of having nothing to do: once or twice she had peeped into the
book her sister was reading, but it had no pictures or conversations in
it, ''and what is the use of a book,'' thought Alice ''without pictures or
conversation?';
	store.
	
	self bucketForTesting newObject
		key: 'p2';
		data: 'So she was considering in her own mind (as well as she could, for the
hot day made her feel very sleepy and stupid), whether the pleasure
of making a daisy-chain would be worth the trouble of getting up and
picking the daisies, when suddenly a White Rabbit with pink eyes ran
close by her.';
		store.
		
	self bucketForTesting newObject
		key: 'p5';
		data: 'The rabbit-hole went straight on like a tunnel for some way, and then
dipped suddenly down, so suddenly that Alice had not a moment to think
about stopping herself before she found herself falling down a very deep
well.';
		store.
		
	result := self client mapReduce 
		bucket: self bucketNameForTesting key: 'p1';
		bucket: self bucketNameForTesting key: 'p2';
		bucket: self bucketNameForTesting key: 'p5';
		map: 'function(value) {
			var words = value.values[0].data.toLowerCase().match(/\w*/g);
			var result = [];
				for(var word in words) {
					if(words[word] != "") {
						var count = {};
						count[words[word]] = 1;
						result.push(count);
					}
				}
			return result;
		}';
		reduce: 'function(values) {
			var result = {};
			for (var value in values) {
				for(var word in values[value]) {
					if (word in result)
						result[word] += values[value][word];
					else
						result[word] = values[value][word];
				}
			}
			return [result];
		}';
		run.
	
	expected := Json readFrom: '{"not":1,"having":1,"down":2,"herself":2,"is":1,"sister":2,"for":2,"mind":1,"as":2,"white":1,"moment":1,"do":1,"deep":1,"a":6,"before":1,"picking":1,"about":1,"whether":1,"that":1,"sitting":1,"or":3,"very":3,"making":1,"tunnel":1,"get":1,"of":5,"the":8,"on":2,"but":1,"reading":1,"in":2,"feel":1,"her":5,"day":1,"peeped":1,"daisy":1,"rabbit":2,"nothing":1,"sleepy":1,"was":3,"chain":1,"conversation":1,"what":1,"made":1,"pictures":2,"considering":1,"thought":1,"getting":1,"pink":1,"pleasure":1,"found":1,"by":2,"eyes":1,"without":1,"up":1,"conversations":1,"went":1,"beginning":1,"hot":1,"straight":1,"into":1,"use":1,"some":1,"book":2,"then":1,"she":4,"well":2,"be":1,"alice":3,"twice":1,"could":1,"would":1,"trouble":1,"tired":1,"like":1,"hole":1,"think":1,"it":2,"falling":1,"close":1,"stopping":1,"suddenly":3,"dipped":1,"daisies":1,"with":1,"and":5,"bank":1,"way":1,"once":1,"so":2,"to":3,"when":1,"ran":1,"had":3,"worth":1,"stupid":1,"no":1,"own":1}' readStream.
	
	self assert: result first = expected