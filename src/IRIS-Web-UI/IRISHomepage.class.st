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
	"Return the context root used for the main entry"
	
	^'home'
]

{ #category : #initialization }
IRISHomepage class >> initialize [
	"Initializes the receiver class"
	
	self register
]

{ #category : #registration }
IRISHomepage class >> register [
	"Register the given application."
	
	| app |
	app := super register.
	app addLibrary: ADTHSDevelopmentLibrary.
	WAAdmin defaultDispatcher defaultName: self contextRoot.	
]

{ #category : #rendering }
IRISHomepage >> children [
^Array with: loginPage
]

{ #category : #rendering }
IRISHomepage >> initialize [

	super initialize.
	loginPage := IRISAuthorizationPage new.
]

{ #category : #rendering }
IRISHomepage >> renderContentOn: html [
	html render: loginPage.
	html script: 'addToHomescreen();'
]

{ #category : #rendering }
IRISHomepage >> updateRoot: htmlRoot [
	super updateRoot: htmlRoot.
	
	htmlRoot meta 
		responseHeaderName: 'X-UA-Compatible';
		content: 'IE=edge,chrome=1'.

	{'viewport'.                      'width=device-width, initial-scale=1'.
	  'apple-mobile-web-app-capable'.  'yes'.
	  'mobile-web-app-capable'.        'yes'.
	  'apple-mobile-web-app-title'. IRISApplicationSettings applicationName.
	} pairsDo: [:x :y |htmlRoot meta name: x; content: y ]
]
