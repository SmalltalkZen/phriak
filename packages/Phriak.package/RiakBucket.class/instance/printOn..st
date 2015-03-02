printing
printOn: stream

	stream 
		nextPutAll: 'RiakBucket[ ';
		nextPutAll: (self client baseUrl 
			addPathSegment: self client bucketsPath;
			addPathSegment: self name;
			asString);
		nextPutAll: ' ]'