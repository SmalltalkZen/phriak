accessing
resetSiblingsWith: aRiakObjectContent
	"Re-initialize the object's siblings/versions with a given content instance"
	siblings := OrderedCollection with: aRiakObjectContent.