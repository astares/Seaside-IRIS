"
Settings for the mail server
"
Class {
	#name : #IRISMailserverSettings,
	#superclass : #IRISSettings,
	#classVars : [
		'MailServer'
	],
	#category : #'IRIS-Web-Runtime-Settings'
}

{ #category : #'settings - accessing' }
IRISMailserverSettings class >> mailServer [

	^MailServer
]

{ #category : #'settings - accessing' }
IRISMailserverSettings class >> mailServer: aServer [

	MailServer := aServer
]

{ #category : #settings }
IRISMailserverSettings class >> mailSettingsOn: aBuilder [
	<irissettings>
	
	(aBuilder group: #irisMail)
		label: 'Mail';
		icon: self iconProvider mailIcon;
		description: 'Mail settings';
		with: [    		  
			(aBuilder 
				setting: #mailServer)
				icon: self iconProvider mailIcon;
				label: 'Mail server' ;
				description: 'The name of the mailserver' ]
]
