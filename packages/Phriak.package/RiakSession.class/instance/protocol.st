accessing
protocol
	^protocol ifNil: [protocol := RiakProtocol on: self]