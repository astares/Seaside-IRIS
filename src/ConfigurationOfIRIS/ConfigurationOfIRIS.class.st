Class {
	#name : #ConfigurationOfIRIS,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfIRIS
}

{ #category : #'development support' }
ConfigurationOfIRIS class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>
]

{ #category : #private }
ConfigurationOfIRIS class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #'ConfigurationOf'
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #'ConfigurationOf' ifAbsent: aBlock ].
]

{ #category : #private }
ConfigurationOfIRIS class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfIRIS class >> ensureMetacelloBaseConfiguration [
  Smalltalk
    at: #'ConfigurationOf'
    ifAbsent: [ 
      | repository version |
      repository := MCHttpRepository
        location: 'http://smalltalkhub.com/mc/dkh/metacello/main'
        user: ''
        password: ''.
      repository
        versionReaderForFileNamed: 'Metacello-Base-dkh.107'
        do: [ :reader | 
          version := reader version.
          version load.
          version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfIRIS class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfIRIS class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfIRIS class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfIRIS class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfIRIS class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfIRIS class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfIRIS >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/IRIS/main/'.
		spec 
			project: 'FontAwesome' with: [
				spec
					className: #ConfigurationOfFontAwesome;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/FontAwesome/main/' ];
			project: 'AddToHomeScreen' with: [
				spec
					className: #ConfigurationOfAddToHomeScreen;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/AddToHomeScreen/main/' ];
			project: 'AnimateCSS' with: [
				spec
					className: #ConfigurationOfAnimateCSS;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/AnimateCSS/main/' ];
			project: 'CSS3Pie' with: [
				spec
					className: #ConfigurationOfCSS3Pie;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/CSS3Pie/main/' ];
			
			project: 'HTML5Shiv' with: [
				spec
					className: #ConfigurationOfHTML5Shiv;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/HTML5Shiv/main/' ];
			project: 'WebBrowser' with: [
				spec
					className: #ConfigurationOfWebBrowser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/WebBrowser/main/' ].
		spec 
			package: 'IRIS-Core-Utilities';
			package: 'IRIS-Tests-Web-UI' with: [
				spec requires: #('IRIS-Web-UI' ). ];
			package: 'IRIS-Web-Components' with: [
				spec requires: #('FontAwesome' 'HTML5Shiv' 'AnimateCSS' 'CSS3Pie' 'AddToHomeScreen' ). ];
			package: 'IRIS-Web-Runtime' with: [
				spec requires: #('IRIS-Web-UI' ). ];
			package: 'IRIS-Web-Tools' with: [
				spec requires: #('IRIS-Web-Runtime' 'WebBrowser' ). ];
			package: 'IRIS-Web-UI' with: [
				spec requires: #('IRIS-Web-Components' ). ].
		spec 
			group: 'Core' with: #('IRIS-Core-Utilities' );
			group: 'Tests' with: #('IRIS-Tests-Web-UI' );
			group: 'Tools' with: #('IRIS-Web-Tools' );
			group: 'Web' with: #('IRIS-Web-Components' 'IRIS-Web-UI' );
			group: 'all' with: #('Core' 'Web' 'Tools' 'Tests' );
			group: 'default' with: #('all' ). ].

]

{ #category : #accessing }
ConfigurationOfIRIS >> customProjectAttributes [
    "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes "

    ^ #()
]

{ #category : #'symbolic versions' }
ConfigurationOfIRIS >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.1-baseline'.

]

{ #category : #accessing }
ConfigurationOfIRIS >> project [
    ^ project
        ifNil: [ 
            "Bootstrap Metacello if it is not already loaded"
            self class ensureMetacello.
            project := MetacelloMCProject new projectAttributes: self customProjectAttributes.	"Create the Metacello project"
            (Smalltalk at: #'MetacelloVersionConstructor') on: self project: project.	"Construct the project"
            project loadType: #'linear'.	"change to #atomic if desired"
            project ]
]
