tests
testStoreObjectWithNoKey
	| bucket rObject storedValue generatedKey result |
	storedValue := 'abc'.
	bucket := self bucketForTesting.
	rObject := bucket newObject
		data: storedValue;
		yourself.
	result := rObject store.
	generatedKey := result at: #key.
	self assert: generatedKey isNotNil