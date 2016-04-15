"
Common superclass for settings
"
Class {
	#name : #IRISSettings,
	#superclass : #Object,
	#category : #'IRIS-Web-Runtime-Settings'
}

{ #category : #'priate - accessing' }
IRISSettings class >> iconProvider [

	^Smalltalk at: #IRISIconCache
]
