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
	| base64Contents fileName contentsMethod iconMethod |
	fileName := UIManager default fileOpen: 'Icon file' extensions: #('png').
	fileName ifNil: [ ^ self ].
	iconName := UIManager default request: 'Icon name' initialAnswer: 'blank'.
	iconName ifNil: [ ^ self ].
	base64Contents := (Base64MimeConverter mimeEncode: fileName binary) contents.
	fileName close.
	contentsMethod := String
		streamContents: [ :s | 
			s
				nextPutAll: iconName;
				nextPutAll: 'IconContents';
				cr;
				cr;
				tab;
				nextPut: $^;
				nextPut: $';
				nextPutAll: base64Contents;
				nextPut: $' ].
	iconMethod := String
		streamContents: [ :s | 
			s
				nextPutAll: iconName;
				nextPutAll: 'Icon';
				cr;
				cr;
				tab;
				nextPutAll: '^self iconNamed: #';
				nextPutAll: iconName;
				nextPutAll: 'Icon' ].
	self class compile: contentsMethod classified: #'private - icons'.
	self class compile: iconMethod classified: #icons
]

{ #category : #'private - accessing' }
IRISToolIcons class >> iconCache [

	^ IconCache ifNil: [ IconCache := Dictionary new ]
]

{ #category : #accessing }
IRISToolIcons class >> iconNamed: aSymbol [
	"Returns the icon with the given name"

	^ self iconCache
		at: aSymbol
		ifAbsentPut: [ 
			Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: (self perform: (aSymbol , 'Contents') asSymbol) readStream) ]
]

{ #category : #'initialization-release' }
IRISToolIcons class >> reset [
	"Reset the icon cache"	
	<script>
	
	IconCache := nil
]

{ #category : #icons }
IRISToolIcons class >> serverIcon [

	^self iconNamed: #serverIcon
]

{ #category : #'private - icons' }
IRISToolIcons class >> serverIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAC0UlEQVR4Xo2SbU+SURzG+RS2
hDdufQBtM0e58GHa8o2W3mbWkjbLhzURTTNEHnwowNKG2oM6JUWF2+fHTJ2aJaFCPlAzJygG
OMPM8qF8wqtbXli2rK7t2v7n7Fy/c8520fbk4nKEkZkpIUViKckXSEj9qBEjehNG3kxDILxL
enoyCVdXVwbtMHl7s4hJ4ypsi1uUHbDad2Fz2kGtd2G2bWBIZ0Jz6wvLHtDL69RBIIvlS2hG
FqEbW4FhcgWmuU0YzduYNu9QswOmDw7MWhwUaAe2Tw7M29dxIyGV3Af4+voR3X1mDAwuoLd/
Hl09c9Q8D/34MgVcxYz1O+yft2Ff3sTYWxvKK/oRxU44CGhpe4/Orlm0tk+joWkS6toJ1KhH
oax5jdLyPsgLn0GUrUZMnBTnw64jPj7lIEBNjqK+8R1U5DiU1XqUP9WitGwQfEEJMgRS5D8o
hrJKjampKQhF9+HjG8j9BeBPlCk0qFDqUKbQ4knJSzwsom6Vd1N/lcJgMGBraxvf1jfw5es6
4mJvwfMEk9gHBAaeIeQFXXhcPIDCwl7k5z9HrqwDUkkL2Ox0aLXDWFvbwsLCMmZm7QgJYeNs
UNBPgLu7B1MirUdeXidk0nbkZDdBLKqjXIuIiBS0tXXBal2C0bSEVxoTgoOjQGfQD/YiLU1M
ioQqZ1AoUEOQoYZISCI8PBnVNc2YMFiocpnR1jEM9lUO/lioa9FJZDqvygnYsxNwIQmKikYq
bMGAZgbquh4kcsU4tJUyWYklg6/aBxDhXBQ9UkE3/hGDQzNIThUg5BxbcyjgKFVRHk9uEWSo
nIAwgoukm3eo0CW4uR1DQEAktRdN0v4md4/jTA4n17L3ipjYe2D5ROK0z0VcTuSBL6zElajY
PNq/5OcfQGRlKZHAKaLal4/bPAXkBa3IypZr6HQ6g/Y/8vI6SVRW9qChUYPsnCJNaGgE9/cz
PwCyhvLlWzqQAwAAAABJRU5ErkJggg=='
]
