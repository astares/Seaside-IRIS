"
A session that is able to expire
"
Class {
	#name : #IRISExpirySession,
	#superclass : #WAExpirySession,
	#instVars : [
		'announcer'
	],
	#category : #'IRIS-Web-UI-Lifetime'
}

{ #category : #accessing }
IRISExpirySession >> announcer [
	^ announcer
]

{ #category : #accessing }
IRISExpirySession >> announcer: anObject [
	^ announcer := anObject
]

{ #category : #initialization }
IRISExpirySession >> initialize [

	super initialize.
	announcer := Announcer new.
]
