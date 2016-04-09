"
The server
"
Class {
	#name : #IRISWebserver,
	#superclass : #Object,
	#classVars : [
		'Default'
	],
	#category : #'IRIS-Web-Runtime-Server'
}

{ #category : #'operating - running' }
IRISWebserver class >> browse [
	<script>
	|baseURL|
	baseURL := 'http://localhost'.
	self defaultPort = 80 ifFalse: [ baseURL := baseURL ,':' , self defaultPort asString].
	IRISWebbrowser openOn: baseURL.
]

{ #category : #'operating - debugging' }
IRISWebserver class >> clearWebSessions [
	<script>
		
	WAAdmin clearSessions
]

{ #category : #'operating - debugging' }
IRISWebserver class >> debugWebSessions [
	<script>
		
	self webSessions inspect
]

{ #category : #accessing }
IRISWebserver class >> default [
	"Return the default instance"
	
	^Default ifNil: [ Default := self new ].
	 
]

{ #category : #'private - defaults' }
IRISWebserver class >> defaultPort [
	"Returns the receivers default port."
	
	^IRISWebserverSettings defaultPort
]

{ #category : #'operating - running' }
IRISWebserver class >> reset [
	"Reset the default server instance"
	<script>
	self stop.
	Default := nil.
	^self start
]

{ #category : #'private - defaults' }
IRISWebserver class >> resourceFolderName [
	"Return the folder name for serving static resources."

	^IRISWebserverSettings resourceFolderName 
]

{ #category : #'operating - running' }
IRISWebserver class >> restart [
	"Restart the default server instance"
	<script>
	
	^self stop; start
]

{ #category : #'operating - running' }
IRISWebserver class >> start [
	"Start the default server instance"
	<script>
	
	^self default start
]

{ #category : #'operating - running' }
IRISWebserver class >> stop [
	"Stop the default server instance"
	<script>
	
	^self default stop
]

{ #category : #accessing }
IRISWebserver class >> webSessions [
	"Return the current web sessions"
	
	^(WADispatcher default handlerAt: IRISHomepage contextRoot) sessions
]

{ #category : #'private - defaults' }
IRISWebserver >> defaultPort [
	"Returns the receivers default port."
	
	^self class defaultPort
]

{ #category : #'private - defaults' }
IRISWebserver >> resourceFolderName [
	"Return the folder name for serving static resources."

	^self class resourceFolderName 
]

{ #category : #'private - running' }
IRISWebserver >> start [
	"Start the webserver."
	
	ZnZincStaticServerAdaptor startOn: self defaultPort andServeFilesFrom: self resourceFolderName 
]

{ #category : #'private - running' }
IRISWebserver >> stop [
	"Stop the webserver."
	
	ZnZincStaticServerAdaptor stop
]
