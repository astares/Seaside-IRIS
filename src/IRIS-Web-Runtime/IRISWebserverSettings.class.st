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

{ #category : #'private - utilities' }
IRISWebserverSettings class >> button: aString action: aBlock [
	^ (Smalltalk ui theme 
		newButtonIn: World
			for: aBlock
			getState: nil 
			action: #value
			arguments: { }
			getEnabled: nil
			getLabel: nil
			help: '')
		label: aString;
		yourself
]

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

{ #category : #settings }
IRISWebserverSettings class >> serverSettingsOn: aBuilder [
	<systemsettings>  
	<webserversettings>
	
	(aBuilder group: #webServer)
		label: 'Webserver';
		description: 'Web server settings';
		with: [    		  
			(aBuilder setting: #resourceFolderName)
				type: #Directory;
				target: self;
				description: 'The path of a directory where static resources are hosted' ;
				label: 'Default local resource folder directory'.
			(aBuilder setting: #defaultPort)
						label: 'Default Port' ;
						description: 'The HTTP port'.	
			(aBuilder pickOne: #deploymentMode)
				type: #Boolean;
				target: self;
				description: 'Production or development';
				label: 'Deployment mode';
				domainValues: #('Production' 'Development')	.		
							
			(aBuilder setting: #webSessions)				 
				target: self;
				icon: IRISIconCache serverIcon;
				label: 'Sessions';
				description: 'Session control';
     			precondition: [ self webSessions notEmpty ]; 
				dialog: [ self sessionControlRow ].							
							
		]
		
]

{ #category : #'private - utilities' }
IRISWebserverSettings class >> sessionControlRow [

	| theme |	
	theme := Smalltalk ui theme.
	^ theme newRowIn: World for: {
		theme buttonLabelForText: self webSessions size asString, ' sessions'.
		self button: 'Inspect' action: [ self webSessions inspect ].
		self button: 'Clear' action: [ WAAdmin clearSessions ].
	}
]

{ #category : #'private - accessing' }
IRISWebserverSettings class >> webSessions [

	^IRISWebserver webSessions 
]

{ #category : #'private - accessing' }
IRISWebserverSettings class >> webSessions: x [
	"do nothing - just a dummy setting"
]
