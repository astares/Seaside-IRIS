"
Settings for the application
"
Class {
	#name : #IRISApplicationSettings,
	#superclass : #Object,
	#classVars : [
		'ApplicationName'
	],
	#category : #'IRIS-Web-Runtime-Settings'
}

{ #category : #'settings - accessing' }
IRISApplicationSettings class >> applicationName [

	^ApplicationName ifNil: [ ApplicationName := 'IRIS' ]
]

{ #category : #'settings - accessing' }
IRISApplicationSettings class >> applicationName: aString [

	ApplicationName := aString
]

{ #category : #settings }
IRISApplicationSettings class >> applicationSettingsOn: aBuilder [
	<irissettings>
	
	(aBuilder group: #irisApplication)
		label: 'Application';
		icon: (IRISIconCache appIcon);
		description: 'Application settings';
		with: [    		  
			(aBuilder 
				setting: #applicationName)
				icon: (IRISIconCache appIcon);
				label: 'Application name' ;
				description: 'The name of the application' ]
]
