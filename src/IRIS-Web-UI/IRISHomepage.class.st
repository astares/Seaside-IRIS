"
IRIS Homepage
"
Class {
	#name : #IRISHomepage,
	#superclass : #IRISRootComponent,
	#instVars : [
		'loginPage'
	],
	#category : #'IRIS-Web-UI-UI-General'
}

{ #category : #defaults }
IRISHomepage class >> contextRoot [

	^'home'
]

{ #category : #initialization }
IRISHomepage class >> initialize [
	"Initializes the receiver class"
	
	self register
]

{ #category : #registration }
IRISHomepage class >> register [

	super register.
	WAAdmin defaultDispatcher defaultName: self contextRoot.	
]

{ #category : #rendering }
IRISHomepage >> children [
^Array with: loginPage
]

{ #category : #rendering }
IRISHomepage >> initialize [

	super initialize.
	loginPage := IRISLoginPage new.
]

{ #category : #rendering }
IRISHomepage >> renderContentOn: html [
	html render: loginPage
]
