"
Login dialog
"
Class {
	#name : #IRISLoginComponent,
	#superclass : #WAComponent,
	#category : #'IRIS-Web-UI-Components-Authorization'
}

{ #category : #rendering }
IRISLoginComponent >> renderContentOn: html [
	html div id: 'form-login'; class: 'form-authorization';
	with: [ 
		self renderImageOn: html.
		self renderProfileNameOn: html.
		self renderFormOn: html.
		html html: 
	           '<a href="#" class="forgot-password" id="action-reminder">
                Forgot your password
            </a>'.
 	].
 


]

{ #category : #'private - rendering' }
IRISLoginComponent >> renderFormContentOn: html [ 

 

	self renderUserNameOn: html.
	self renderPasswordOn: html.


	html
		html:
			'
               
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember Me!
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Let''s Go!</button>
	'
	 
]

{ #category : #'private - rendering' }
IRISLoginComponent >> renderFormOn: html [
		html form 	
				class: 'form-signin';
				with: [ self renderFormContentOn: html ]
		
]

{ #category : #'private - rendering' }
IRISLoginComponent >> renderImageOn: html [
	html image
		id: 'profile-img';
		class: 'profile-img-card';
		url: IRISImageFileLibary / #avatarPng
]

{ #category : #'private - rendering' }
IRISLoginComponent >> renderPasswordOn: html [

	html
		inputGroup: [
			html inputGroupPrepend: [ "html tbsGlyphIcon iconLock" ].
			html passwordInput 
				formControl;
				id: 'inputPassword';
				placeholder: 'Password'; 
				"callback: [ :value | credentials password: value ];	"
				required. 
			]
]

{ #category : #'private - rendering' }
IRISLoginComponent >> renderProfileNameOn: html [

	html paragraph 
		id: 'profile-name';
		class: 'profile-name-card';
		with: 'Please login'

]

{ #category : #'private - rendering' }
IRISLoginComponent >> renderUserNameOn: html [
 
	
	html
		inputGroup 	marginBottom: 3; with: [ 			
			IRISApplicationSettings loginNameType = #email
				ifTrue: [ html inputGroupPrepend: [ html inputGroupText: [ html span fontAwesome fontAwesomeUserIcon ] ].
					 
					html emailInput
						id: 'inputUsername';
						formControl ;
						placeholder: 'E-Mail';
						required;
						autofocus ]
				ifFalse: [ html inputGroupPrepend: [ "html tbsGlyphIcon iconUser" ].
					html textInput
						id: 'inputUsername';
						formControl;
						placeholder: 'Username';
						required;
						autofocus ] ]
]

{ #category : #rendering }
IRISLoginComponent >> rendererClass [
	
	^ SBSHtmlCanvas 
]

{ #category : #scripting }
IRISLoginComponent >> script [
	"This script checks for ENTER in the edit fields and if pressed triggers a click (submit) on the login dialog.
	 see http://stackoverflow.com/questions/8294465/making-enter-key-on-an-html-form-submit-instead-of-activating-button
	"
	
	^' 
	$("#inputUsername").focus();
	$("#inputUsername").select();
			 
	$("#form-signin input").keypress(function (e) {
			alert("hi");
		  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {				
            $("#loginDialog button[type=submit]").click();
            return false;
        } else {
            return true;
        }
    });

	
	'
]
