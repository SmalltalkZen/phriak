running
run
	^self session protocol mapReduceOperation 
		mapReduce: self;
		run