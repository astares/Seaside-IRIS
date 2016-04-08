"
A component rendered when something is not found
"
Class {
	#name : #IRISNotFoundComponent,
	#superclass : #IRISRootComponent,
	#category : #'IRIS-Web-UI-UI-General'
}

{ #category : #defaults }
IRISNotFoundComponent class >> contextRoot [

	^'notFound'
]

{ #category : #initialization }
IRISNotFoundComponent class >> initialize [
	"Initializes the receiver class"
	
	self register
]

{ #category : #rendering }
IRISNotFoundComponent >> renderContentOn: html [
	html heading
		level: 1;
		with: 'Resource not found'.
	html paragraph: 'The page you requested could not be found, either contact the webmaster or try again.'.
	html break.
	html break.
	html button
		onClick: 'history.back()';
		with: 'Back'
]

{ #category : #styling }
IRISNotFoundComponent >> style [
	<css>

	^'
body, html {   
    background-repeat: no-repeat;
    background-color: #003D78;	
}	
h1, p { 
	color: white;
	text-align: center; }	
		
button {
 	display:block;
	margin:0 auto;
}'
]
