"
A user of the system

 loginName                  -  the name the users used to login to the system - need to be uique
 username                    - the users name (typically used for logging)
 email                             - the email address of the user 
 securedPassword    - the password stored in a secure always 
 locked                           - the user is locked (for instance when entering the password wrong too often)
 deactivated                - if the user is deactivated he is not allowed to login anymore
 roles                               - roles a user can have 
"
Class {
	#name : #IRISUser,
	#superclass : #Object,
	#instVars : [
		'loginName',
		'username',
		'email',
		'securedPassword',
		'locked',
		'deactivated',
		'roles'
	],
	#category : #'IRIS-Core-UserManagement-Model'
}
