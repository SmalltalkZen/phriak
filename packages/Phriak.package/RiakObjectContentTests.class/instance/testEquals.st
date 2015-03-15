testing
testEquals
	"Test the = method"

	| content1 content2 |
	content1 := RiakObjectContent new
		contentType: 'text/plain/';
		data: 'some text data';
		etag: 'abc123';
		deleted: false;
		indexes: OrderedCollection new;
		metadata: Dictionary new;
		lastModified:TimeStamp today;
		yourself.
	content2 := RiakObjectContent new
		contentType: 'text/plain/';
		data: 'some text data';
		etag: 'abc123';
		deleted: false;
		indexes: OrderedCollection new;
		metadata: Dictionary new;
		lastModified:TimeStamp today;
		yourself.
	self assert: content1 = content2