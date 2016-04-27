"
Tests for root components
"
Class {
	#name : #IRISRootComponentTest,
	#superclass : #TestCase,
	#category : #'IRIS-Tests-Web-UI-UI-General'
}

{ #category : #testing }
IRISRootComponentTest class >> isAbstract [

	^self name = #IRISRootComponentTest
]

{ #category : #accessing }
IRISRootComponentTest >> defaulTestClass [

	^self subclassResponsibility 
]

{ #category : #tests }
IRISRootComponentTest >> testIsRegistered [

	self assert: (WAAdmin  defaultDispatcher handlerAt: self defaultTestClass contextRoot) notNil
]