"
A reminder component to remind on password
"
Class {
	#name : #IRISReminderComponent,
	#superclass : #WAComponent,
	#category : #'IRIS-Web-UI-Components-Authorization'
}

{ #category : #rendering }
IRISReminderComponent >> html [

^'<div style="display: none;" class="form-authorization">
    <h4 class="">
      Forgot your password?
    </h4>
    <form accept-charset="UTF-8" role="form" id="login-recordar" method="post">
      <fieldset>
        <span class="help-block">
          Enter the E-Mail address you use to log in to your account.
          <br><br>
          We''ll send you an email with instructions to choose a new password.</span>
        <div class="form-group input-group">
          <span class="input-group-addon">
            @
          </span>
          <input class="form-control" placeholder="E-Mail" name="email" type="email" required="">
        </div>
        <button type="submit" class="btn btn-primary btn-block" id="btn-olvidado">
          Continue
        </button>
        <p class="help-block">
          <a class="text-muted" href="#" id="action-login"><small>Account Access</small></a>
        </p>
      </fieldset>
    </form>
  </div>'
]

{ #category : #rendering }
IRISReminderComponent >> renderContentOn: html [

	html html: self html
]
