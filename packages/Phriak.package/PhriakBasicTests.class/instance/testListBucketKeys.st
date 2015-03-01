tests
testListBucketKeys
	| bucket |
	bucket := self bucketForTesting.
	bucket newObject
		data: 'abc';
		key: 'test';
		store.
	self assert: bucket keys size equals:1