"
An UUID generator
"
Class {
	#name : #IRISGUIDGenerator,
	#superclass : #Object,
	#category : #'IRIS-Core-Utilities-Utilities'
}

{ #category : #accessing }
IRISGUIDGenerator >> newID [
	"Returns a string representing a new unique ID"
	
	^(UUID new asString copyReplaceAll: '-' with: '') asUppercase
]
