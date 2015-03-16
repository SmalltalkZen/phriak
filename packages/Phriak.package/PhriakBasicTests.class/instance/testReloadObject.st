testing
testReloadObject
	| bucket  testKey originalObject modifiedObject |

	bucket := self bucketForTesting.
	testKey := 'test-reloaded-string'.
	originalObject := bucket newObject
		data: 'first value';
		key: testKey;
		store;
		yourself.
	
	"Now modify the object at that key, meanwhile"
	modifiedObject := bucket newObject
		data: 'modified value';
		key: testKey;
		store;
		yourself.
	
	self deny: originalObject = modifiedObject.
	originalObject reload.
	
	self assert: originalObject = modifiedObject.
	self assert: originalObject data = 'modified value'.
	self assert: originalObject key = testKey.
	self assert: originalObject etag = modifiedObject etag.
