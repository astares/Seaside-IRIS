"
The login page following

http://bootsnipp.com/snippets/X0xm0
"
Class {
	#name : #IRISAuthorizationPage,
	#superclass : #IRISWebComponent,
	#instVars : [
		'loginComponent',
		'reminderComponent'
	],
	#category : #'IRIS-Web-UI-UI-General'
}

{ #category : #accessing }
IRISAuthorizationPage >> children [

	^Array with: loginComponent with: reminderComponent
]

{ #category : #rendering }
IRISAuthorizationPage >> htmlVideo [
	"see http://www.beachfrontbroll.com/p/cities-and-traffic.html"
	
	^'<video width="300" height="150" autoplay="autoplay" loop="loop" muted="" style="
	 position: fixed;
  top: 50%; left: 50%;
  z-index: 0;
  min-width: 100%;
  min-height: 100%;
 // width: auto;
  height: auto;
  transform: translate(-50%, -50%);
	">
  <source src="http://ia800305.us.archive.org/26/items/CorporateCloudTimeLapse/CorporateCloudH264.mp4" type="video/mp4" />
  <source src="media/demo.ogv" type="video/ogg" />
  <source src="media/demo.webm" type="video/webm" />
  </video>'
]

{ #category : #initialization }
IRISAuthorizationPage >> initialize [

	super initialize.
	loginComponent := IRISLoginComponent new.
	reminderComponent := IRISReminderComponent new.
]

{ #category : #'private - rendering' }
IRISAuthorizationPage >> renderCardContainerOn: html [ 

	html div 	
		class: 'card';
		class: 'card-container';
		style: 'z-index: 4;';
		with: [ 
			html html: ' <h4 style="border-bottom: 1px solid #c5c5c5;">
    <i class="glyphicon glyphicon-user">
    </i>
    Account Access
  </h4>'. html break.
			
			html 
					render: reminderComponent;
					render: loginComponent ]
]

{ #category : #rendering }
IRISAuthorizationPage >> renderContentOn: html [

	html div 
		class: 'container';
		with: [ 
			
			html html: self htmlVideo.
			self renderCardContainerOn: html ].
	html script: self toggleScript	
]

{ #category : #styling }
IRISAuthorizationPage >> style [
	<css>
	
	^'
/*
 * Specific styles of signin component
 */
/*
 * General styles
 */
body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-color: #003D78;
}

.card-container.card {
    width: 350px;
    padding: 40px 40px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #fff;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.3);
    box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.3);

}

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin input[type=email],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;	 
    z-index: 1;
	margin-bottom: 10px;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #inputUsername,
.form-signin #inputPassword {
    direction: ltr;
    height: 44px;
	 margin-bottom: 0px;
    font-size: 16px;
}

.form-signin div[class=input-group] { 
	margin-bottom: 10px;
}

.form-signin .form-control:focus {
    border-color: #0685FF;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px #0066CC;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px #0066CC;
}

.btn-signin {
    /*background-color: #4d90fe; */
    background-color: #0066CC;
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn-signin:hover,
.btn-signin:active,
.btn-signin:focus {
    background-color: #0685FF;
}

.forgot-password {
    color: #0685FF;
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: #004e99;
}'
]

{ #category : #styling }
IRISAuthorizationPage >> toggleScript [
	"This script toggles the login and the password reminder component. See http://bootsnipp.com/snippets/featured/login-amp-password-reminder"
	
	^'
	$("#action-reminder").click(function(e) {
    	e.preventDefault();
    	$(".form-authorization").toggle("500");
  });

	$("#action-login").click(function(e) {
    	e.preventDefault();
    	$(".form-authorization").toggle("500");
  });
	
	'
]
