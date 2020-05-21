Extension { #name : #SettingTreeBuilder }

{ #category : #'*IRIS-Web-Runtime' }
SettingTreeBuilder >> irissettings [
	"Process a <irissettings> pragma"

	currentPragma methodClass instanceSide
		perform: currentPragma selector
		with: self
]
