private
doRun
	| znClient  |

	znClient := self httpClient
		
	 headerAt: 'Accept' put:'*/*, multipart/mixed';
		url: self url;
		yourself.

	^ znClient get