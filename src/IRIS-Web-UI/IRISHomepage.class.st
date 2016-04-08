"
IRIS Homepage
"
Class {
	#name : #IRISHomepage,
	#superclass : #WAComponent,
	#instVars : [
		'loginPage'
	],
	#category : #'IRIS-Web-UI-UI'
}

{ #category : #initialization }
IRISHomepage class >> initialize [
	"Initializes the receiver class"
	
	self register
]

{ #category : #registration }
IRISHomepage class >> register [
	"Register the application"
	<script>
	
	|app|
	app := WAAdmin register: self asApplicationAt: 'iris'.
	WAAdmin defaultDispatcher defaultName: 'iris'.
	app 
		addLibrary: IRISFileLibrary 
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

{ #category : #rendering }
IRISHomepage >> updateRoot: htmlRoot [
	super updateRoot: htmlRoot.
	htmlRoot title: 'IRIS'
]
