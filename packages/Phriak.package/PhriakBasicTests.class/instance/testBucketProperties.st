tests
testBucketProperties
	| bucket |
	bucket := self bucketForTesting.
	self assert: ((bucket properties at: 'name') = self bucketNameForTesting)