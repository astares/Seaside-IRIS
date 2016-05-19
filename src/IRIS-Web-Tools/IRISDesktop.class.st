"
Utility to style a custom desktop
"
Class {
	#name : #IRISDesktop,
	#superclass : #Object,
	#category : #'IRIS-Web-Tools-Desktop'
}

{ #category : #'private - accessing' }
IRISDesktop class >> imageURL [

	^'http://files.pharo.org/media/logo/icon-lighthouse-512x512.png'
]

{ #category : #'private - initialization' }
IRISDesktop class >> initDesktop [
	
	Display fullscreen: true.
	World color: Color white.
	 
]

{ #category : #'private - initialization' }
IRISDesktop class >> initLogo [

	|logo|
	logo := (ZnEasy getPng: self imageURL )asMorph.	
	PolymorphSystemSettings setDesktopLogoWith: logo.
	logo position: 10@80.

]

{ #category : #'private - initialization' }
IRISDesktop class >> initTopBar [

	| morph color|
	color := Color fromHexString: '003D78'.
	morph := BorderedMorph new
	color: color;
	borderColor: color;
	position: 0@0;
	extent: 2000@80.
	
	World addMorph: morph.
	morph
		lock;	
		openInWorld.

]

{ #category : #initialize }
IRISDesktop class >> initialize [
	
	self 
		initDesktop;
		initLogo;
		initTopBar

]
