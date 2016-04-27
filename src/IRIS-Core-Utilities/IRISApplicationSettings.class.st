"
Settings for the application
"
Class {
	#name : #IRISApplicationSettings,
	#superclass : #IRISSettings,
	#classVars : [
		'ApplicationName',
		'LoginNameType'
	],
	#category : #'IRIS-Core-Utilities-Settings'
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
		icon: self iconProvider appIcon;
		description: 'Application settings';
		with: [    		  
			(aBuilder 
				setting: #applicationName)
				icon: self iconProvider appIcon;
				label: 'Application name' ;
				description: 'The name of the application'.
			self loginSettingsOn: aBuilder			
  ]
]

{ #category : #'private - accessing' }
IRISApplicationSettings class >> loginNameChoices [

	^#(email 'E-Mail address' 
	   string 'String (no space)'
		stringWhitespace 'String (space allowed)') pairsCollect: [:a :b | b -> a]
]

{ #category : #'settings - accessing' }
IRISApplicationSettings class >> loginNameType [

	^LoginNameType ifNil: [ LoginNameType := #email ]
]

{ #category : #'settings - accessing' }
IRISApplicationSettings class >> loginNameType: aSymbol [
	"see #loginNameChoices for allowed values"
	((self loginNameChoices collect: [:each | each value ]) includes: aSymbol) ifFalse: [ self error: 'Invalid symbol' ].
	LoginNameType := aSymbol
]

{ #category : #settings }
IRISApplicationSettings class >> loginSettingsOn: aBuilder [			
  
	(aBuilder pickOne: #loginNameType)
				label: 'Login name type' translated;
				target: self;
				default: #email;
				order: 1;
				domainValues: self loginNameChoices.
]
