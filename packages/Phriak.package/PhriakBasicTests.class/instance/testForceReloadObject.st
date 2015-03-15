tests
testForceReloadObject
	"Test #reloadForce operation"
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
	
	"If we use the latest etag, the reload will just get a 204 Not Modified, and not reload the data"
	originalObject etag: modifiedObject etag.
	originalObject reload.
	self assert: originalObject data = 'first value'.
	self deny: originalObject = modifiedObject.
	
	"However, using #reloadForce will not send the etag, and will force the refresh"
	originalObject reloadForce.
	self assert: originalObject = modifiedObject.
	self assert: originalObject data = 'modified value'.
