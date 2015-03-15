persistence
reloadForce
	"Reload from the latest version of this object. (Do not send an If-Not-Modified header).
	 This is important to do before update or delete operations."

	self reloadFrom: (self bucket reloadForce: self)