running
run
	^self client mapReduceOperation 
		mapReduce: self;
		run