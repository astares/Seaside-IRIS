"
Utility class for caching icons (preventing unnnecessary instances of Forms).

 
"
Class {
	#name : #IRISToolIcons,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#classInstVars : [
		'iconName'
	],
	#category : #'IRIS-Web-Tools-Utilities'
}

{ #category : #generate }
IRISToolIcons class >> generateIcon [
	<script>
	| file base64Contents fileName contentsMethod |
	fileName := UIManager default
		fileSave: 'PNG file'
		initialAnswer: 'icon.png'
		extensions: #('png')
		path: FileSystem workingDirectory fullName.
	fileName ifNil: [ ^self ].	
	iconName := UIManager default request: 'Icon name' initialAnswer: 'blank'.
	iconName ifNil: [ ^self ].
	file := FileStream readOnlyFileNamed: fileName.
	base64Contents := (Base64MimeConverter mimeEncode: file binary) contents.
	file close.
	contentsMethod := String
		streamContents: [ :s | 
			s
				nextPutAll: iconName;
				nextPutAll: 'IconContents';
				cr;
				tab;
				nextPut: $^;
				nextPut: $';
				nextPutAll: base64Contents;
				nextPut: $' ].
	contentsMethod inspect
	"self compile: contentsMethod classified: 'private - icons'.
	"
]

{ #category : #'private - accessing' }
IRISToolIcons class >> iconCache [

	^ IconCache ifNil: [ IconCache := Dictionary new ]
]

{ #category : #accessing }
IRISToolIcons class >> iconNamed: aSymbol [
	"Returns the icon with the given name"
	
	^(self iconCache) 
		at: aSymbol 
		ifAbsentPut: [ self perform: aSymbol ]
]

{ #category : #'initialization-release' }
IRISToolIcons class >> reset [
	"Reset the icon cache"	
	<script>
	
	IconCache := nil
]
