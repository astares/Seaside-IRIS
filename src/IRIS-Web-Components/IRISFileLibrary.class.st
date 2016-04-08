"
File library
"
Class {
	#name : #IRISFileLibrary,
	#superclass : #WAFileLibrary,
	#category : #'IRIS-Web-Components-Libraries'
}

{ #category : #updating }
IRISFileLibrary >> updateRoot: htmlRoot [
	super updateRoot: htmlRoot.

	htmlRoot stylesheet 
		url: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css';
		attributeAt: 'integrity' put: 'sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7';
		attributeAt: 'crossorigin' put: 'anonymous'	.

	htmlRoot stylesheet 
		url: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css';
		attributeAt: 'integrity' put: 'sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r';
		attributeAt: 'crossorigin' put: 'anonymous'	
]
