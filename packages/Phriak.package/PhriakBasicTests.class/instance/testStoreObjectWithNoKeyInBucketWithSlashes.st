testing
testStoreObjectWithNoKeyInBucketWithSlashes
	"protocol: testing"

	| bucket rObject storedValue |
	storedValue := 'abc'.
	bucket := self client bucketNamed: '_phriaktest/bucket/with/slashes'.
	rObject := bucket newObject
		data: storedValue;
		yourself.
	self assert: rObject key isNil.	"Store an object with no key, in a bucket with slashes in the name"
	rObject store.	"The generated key should still be parsed correctly, and object can be reloaded"
	rObject reload.
	self assert: rObject key isNil not.
	self assert: rObject data = storedValue.
	self assert: rObject context isNil not.	"Cleanup (for this test)"
	bucket devModeOnlyRemoveAll