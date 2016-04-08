"
A custom response generator handling not found
"
Class {
	#name : #IRISHtmlResponseGenerator,
	#superclass : #WAHtmlResponseGenerator,
	#category : #'IRIS-Web-UI-Utilities'
}

{ #category : #initialization }
IRISHtmlResponseGenerator class >> initialize [

	WAAdmin defaultDispatcher configuration at: #responseGenerator put: self  
]

{ #category : #handling }
IRISHtmlResponseGenerator >> notFound [
 	"Return a custom response for not found"
	 
	self response
		redirectTo: '/', IRISNotFoundComponent contextRoot 
]
