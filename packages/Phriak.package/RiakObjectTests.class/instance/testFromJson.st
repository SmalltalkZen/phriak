testing
testFromJson
	| json object |
	json := '{
        "bucket": "hb",
        "key": "second",
        "vclock": "a85hYGBgzGDKBVIsLEHbN2YwJTLmsTLMPvDzCF8WAA==",
        "values": [
            {
                "metadata": {
                    "Links": [
                        ["hb","fourth","foo"]
                    ],
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
	self assert: object vclock = 'a85hYGBgzGDKBVIsLEHbN2YwJTLmsTLMPvDzCF8WAA=='.
	self assert: object links first = (RiakLink bucket: 'hb' key: 'fourth' tag: 'foo').
	self assert: object indexes first = (RiakIndex key: 'hello' value: 'world').
	self assert: object contentType = 'text/plain'.
	self assert: object data = 'the second'
