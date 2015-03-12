private
addHeadersTo: znClient
	"Return the headers that should be sent with the Fetch Object request.
	Only send If-None-Match if forceReload is false, and a valid ETag is present."

	znClient headerAt: 'Accept' put: '*/*, multipart/mixed'.
	(self forceReload not and: [ self etagValid ])
		ifTrue: [ znClient headerAt: 'If-None-Match' put: self object etag ]