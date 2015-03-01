printing
printOn: stream

	stream 
		nextPutAll: 'RiakBucket[ ';
		nextPutAll: (self session protocol baseUrl 
			addPathSegment: self session protocol bucketsPath;
			addPathSegment: self name;
			asString);
		nextPutAll: ' ]'