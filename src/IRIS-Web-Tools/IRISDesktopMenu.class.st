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
