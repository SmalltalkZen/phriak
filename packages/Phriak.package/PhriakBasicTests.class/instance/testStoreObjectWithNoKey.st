testing
testStoreObjectWithNoKey
	| bucket rObject storedValue |
	storedValue := 'abc'.
	bucket := self bucketForTesting.
	rObject := bucket newObject
		data: storedValue;
		yourself.
	self assert: rObject key isNil.
	rObject store.
	self assert: rObject key isNil not.
	self assert: rObject data = storedValue.
	self assert: rObject context isNil not.
