"
Settings for the web server
"
Class {
	#name : #IRISWebserverSettings,
	#superclass : #Object,
	#classVars : [
		'DefaultPort',
		'DeploymentMode',
		'ResourceFolderName'
	],
	#category : #'IRIS-Web-Runtime-Settings'
}

{ #category : #'settings - accessing' }
IRISWebserverSettings class >> defaultPort [

	^DefaultPort ifNil: [ DefaultPort := 8080 ]
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

{ #category : #'initialization-release' }
IRISWebserverSettings class >> reset [
	<script>
	
	DefaultPort := ResourceFolderName := nil
]

{ #category : #'settings - accessing' }
IRISWebserverSettings class >> resourceFolderName [
	^ ResourceFolderName
		ifNil: [ ResourceFolderName := (FileSystem workingDirectory / 'www')
				ensureCreateDirectory;
				fullName ]
]

{ #category : #'settings - accessing' }
IRISWebserverSettings class >> resourceFolderName: aString [

	ResourceFolderName := aString
 
]
