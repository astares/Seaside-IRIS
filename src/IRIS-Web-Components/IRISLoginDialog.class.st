"
Login dialog
"
Class {
	#name : #IRISLoginDialog,
	#superclass : #WAComponent,
	#category : #'IRIS-Web-Components-Dialogs'
}

{ #category : #rendering }
IRISLoginDialog >> renderContentOn: html [
	self renderImageOn: html.
	self renderProfileNameOn: html.
	self renderFormOn: html.
	html html: 
	           '<a href="#" class="forgot-password">
                Forgot your password?
            </a>'
]

{ #category : #'private - rendering' }
IRISLoginDialog >> renderFormContentOn: html [ 

	html html: '<span id="reauth-email" class="reauth-email"></span>'.

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
IRISLoginDialog >> renderFormOn: html [
		html form 	
				class: 'form-signin';
				with: [ self renderFormContentOn: html ]
		
]

{ #category : #'private - rendering' }
IRISLoginDialog >> renderImageOn: html [
	html image
		id: 'profile-img';
		class: 'profile-img-card';
		url: IRISImageFileLibary / #avatarPng
]

{ #category : #'private - rendering' }
IRISLoginDialog >> renderPasswordOn: html [

	html
		tbsInputGroup: [
			html tbsInputGroupAddOn: [ html tbsGlyphIcon iconLock ].
			html passwordInput 
				tbsFormControl;
				id: 'inputPassword';
				placeholder: 'Password'; 
				"callback: [ :value | credentials password: value ];	"
				required. 
			]
]

{ #category : #'private - rendering' }
IRISLoginDialog >> renderProfileNameOn: html [

	html paragraph 
		id: 'profile-name';
		class: 'profile-name-card';
		with: 'Please login'

]

{ #category : #'private - rendering' }
IRISLoginDialog >> renderUserNameOn: html [
	html
		tbsInputGroup: [ 			
			IRISApplicationSettings loginNameType = #email
				ifTrue: [ html tbsInputGroupAddOn: [ html tbsGlyphIcon iconEnvelope ].
					html emailInput
						id: 'inputUsername';
						tbsFormControl;
						placeholder: 'E-Mail';
						required;
						autofocus ]
				ifFalse: [ html tbsInputGroupAddOn: [ html tbsGlyphIcon iconUser ].
					html textInput
						id: 'inputUsername';
						tbsFormControl;
						placeholder: 'Username';
						required;
						autofocus ] ]
]

{ #category : #scripting }
IRISLoginDialog >> script [
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
