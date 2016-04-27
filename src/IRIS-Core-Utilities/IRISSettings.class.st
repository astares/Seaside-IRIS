"
Common superclass for settings
"
Class {
	#name : #IRISSettings,
	#superclass : #Object,
	#category : #'IRIS-Core-Utilities-Settings'
}

{ #category : #'priate - accessing' }
IRISSettings class >> iconProvider [

	^Smalltalk at: #IRISIconCache
]
