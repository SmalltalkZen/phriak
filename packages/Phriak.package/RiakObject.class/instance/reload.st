persistence
reload
	"Reload from the latest version of this object.
	 This is important to do before update or delete operations."

	self reloadFrom: (self bucket reload: self)