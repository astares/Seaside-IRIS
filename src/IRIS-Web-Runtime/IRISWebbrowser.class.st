"
Utility class to open a webbrowser on the various operating systems
"
Class {
	#name : #IRISWebbrowser,
	#superclass : #Object,
	#category : #'IRIS-Web-Runtime-Utilities'
}

{ #category : #operating }
IRISWebbrowser class >> openOn: url [
	<script: 'self openOn: ''http://localhost'' '>
	
	Smalltalk os isUnix ifTrue: [ ^self unixBrowse: url ].
	Smalltalk os isWindows ifTrue: [ ^self winBrowse: url ].
	self error: 'Browsing for platform not implemented'
]

{ #category : #'private - windows' }
IRISWebbrowser class >> shellExecute: lpOperation file: lpFile parameters: lpParameters directory: lpDirectory show: nShowCmd [
	
	^self ffiCall: #( 
			FFIConstantHandle ShellExecuteA(
     				0,
     				String* lpOperation,
         			String* lpFile,
     				String* lpParameters,
     				String* lpDirectory,
        			int nShowCmd)) module: #shell32
	

]

{ #category : #'private - linux' }
IRISWebbrowser class >> system: command [
	
	 ^self ffiCall: #(int system(char* command) ) 
			  module: LibC
]

{ #category : #'private - linux' }
IRISWebbrowser class >> unixBrowse: url [

	^self system: 'xdg-open ',url,' &'
]

{ #category : #'private - windows' }
IRISWebbrowser class >> winBrowse: url [
	"
	self winBrowse: 'http://www.pharo-project.org'
	"
	^self shellExecute: 'open' file: url parameters: '' directory: '' show: 5 "SW_SHOW"
]
