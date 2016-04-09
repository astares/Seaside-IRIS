"
The desktop menu
"
Class {
	#name : #IRISDesktopMenu,
	#superclass : #Object,
	#category : #'IRIS-Web-Tools-Desktop'
}

{ #category : #'private - accessing' }
IRISDesktopMenu class >> mainMenuSymbol [
	
	^IRISApplicationSettings applicationName asSymbol
]

{ #category : #'world menu' }
IRISDesktopMenu class >> menuCommandOn: aBuilder [ 
	<worldMenu>
	
	| parent |
	parent := self mainMenuSymbol.
	(aBuilder item: parent)
		order: 3.0; 	 
		icon: (IRISIconCache appIcon).
	aBuilder withSeparatorAfter .	
		
	(aBuilder item: #'Settings')
		order: 120;	
		icon: (Smalltalk ui icons smallConfigurationIcon);
		parent: parent;
		action: [ SettingBrowser openIRISSettings ]
]

{ #category : #'world menu' }
IRISDesktopMenu class >> serverMenuCommandOn: aBuilder [ 
	<worldMenu>
	
	|parent|
	parent := self mainMenuSymbol.
	(aBuilder item: #'Webserver')
		parent: parent;
		order: 2;	
		icon: IRISIconCache serverIcon.
	
	(aBuilder item: #'Start webserver')
		parent: #'Webserver';
		icon: IRISIconCache serverStartIcon;
		action: [ IRISWebserver start ].
	
	(aBuilder item: #'Stop webserver')
		parent: #'Webserver';
		icon: IRISIconCache serverStopIcon;
		action: [ IRISWebserver stop ].
				
	aBuilder withSeparatorAfter.

	(aBuilder item: #'Browse')
		parent: #'Webserver';
		icon: IRISIconCache serverIcon;
		action: [ IRISWebserver browse ]			
]
