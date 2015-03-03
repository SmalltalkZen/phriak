testing
testFromJson
	| json object |
	json := '{
        "bucket": "hb",
        "key": "second",
        "context": "a85hYGBgzGDKBVIsLEHbN2YwJTLmsTLMPvDzCF8WAA==",
        "values": [
            {
                "metadata": {
			  "index": {
		            "hello_bin": "world"
		        },
                    "X-Riak-VTag": "2ZKEJ2gaT57NT7xhLDPCQz",
                    "content-type": "text/plain",
                    "X-Riak-Last-Modified": "Wed, 24 Feb 2010 15:24:11 GMT",
                    "X-Riak-Meta": []
                },
                "data": "the second"
            }
        ]
    }'.

	object := RiakObject fromJson: (Json readFrom: json readStream) client: RiakClient default.
	self assert: object bucket name = 'hb'.
	self assert: object key = 'second'.
	self assert: object context = 'a85hYGBgzGDKBVIsLEHbN2YwJTLmsTLMPvDzCF8WAA=='.
	self assert: object indexes first = (RiakIndex key: 'hello' value: 'world').
	self assert: object contentType = 'text/plain'.
	self assert: object data = 'the second'
