"
Settings for the web server
"
Class {
	#name : #IRISWebserverSettings,
	#superclass : #Object,
	#classVars : [
		'DefaultPort',
		'DeploymentMode'
	],
	#category : #'IRIS-Web-Runtime-Settings'
}

{ #category : #'settings - accessing' }
IRISWebserverSettings class >> defaultPort [

	^DefaultPort ifNil: [ DefaultPort := 80 ]
]

{ #category : #'settings - accessing' }
IRISWebserverSettings class >> defaultPort: aPort [

	DefaultPort := aPort
]

{ #category : #'settings - accessing' }
IRISWebserverSettings class >> deploymentMode [

	^DeploymentMode ifNil: [ DeploymentMode := 'Development' ]
]

{ #category : #'settings - accessing' }
IRISWebserverSettings class >> deploymentMode: aMode [

	DeploymentMode := aMode.
	
 
]
