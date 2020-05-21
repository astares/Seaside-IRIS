"
Common superclass for root components
"
Class {
	#name : #IRISRootComponent,
	#superclass : #IRISWebComponent,
	#category : #'IRIS-Web-UI-UI-General'
}

{ #category : #testing }
IRISRootComponent class >> canBeRoot [
	"Return true for root components, false otherwise."
	
	^true
]

{ #category : #defaults }
IRISRootComponent class >> contextRoot [
	"Return the default context root"
	
	^self subclassResponsibility 
]

{ #category : #testing }
IRISRootComponent class >> isAbstract [ 

	^self == IRISRootComponent
]

{ #category : #registration }
IRISRootComponent class >> register [
	"Register the application"	 
	
	|application|
	application := WAAdmin register: self asApplicationAt: self contextRoot.	
	application 
		addLibrary: IRISFileLibrary;
		addLibrary: JQDeploymentLibrary;
		addLibrary: SBSDevelopmentLibrary;
		addLibrary: FAWDevelopmentLibrary. 
	^application
]

{ #category : #rendering }
IRISRootComponent >> updateRoot: htmlRoot [
	super updateRoot: htmlRoot.	
	htmlRoot title: IRISApplicationSettings applicationName.	
	
]
