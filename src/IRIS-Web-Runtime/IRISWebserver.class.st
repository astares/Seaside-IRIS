"
The server
"
Class {
	#name : #IRISWebserver,
	#superclass : #Object,
	#category : #'IRIS-Web-Runtime-Server'
}

{ #category : #debugging }
IRISWebserver class >> clearWebSessions [
	<script>
		
	WAAdmin clearSessions
]

{ #category : #debugging }
IRISWebserver class >> debugWebSessions [
	<script>
		
	(WADispatcher default handlerAt: IRISHomepage contextRoot) sessions inspect
]
