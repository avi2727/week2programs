#!/bin/bash -x

echo "              ********** Welcome User Registration page **********
Firstname:Start with capital letter 
LastName :Start with capital letter 
Email    :E.g.abc.xyz@bl.co.in
Mobile   :E.g 91 9665435434
Password :one upper,numeric,special character,and must be 8 letter"



#CHECKING VALID OR INVALID CONDITIONS
function conditionCheck()
{
	if [[ $value =~ $regexPattern ]]
	then
		echo "valid! "
	else
		echo "invalid!"
	fi
}

#FUNCTION OF FIRST NAME
function firstName()
{
	
	read -p "             First name :" value
	regexPattern="^[A-Z][a-zA-Z]{2,}$"
	conditionCheck
}

#FUNCTION OF LAST NAME
function lastName()
{
	
	read -p "             Enter Last name :" value
	regexPattern="^[A-Z]{1}[a-zA-Z]{2,}$"
	conditionCheck
}

#FUNCTION OF E-MAIL
function email()
{
	
	read -p "             Enter Email id :" value
	regexPattern="^[a-zA-Z0-9+-]{1,}([.][a-z0-9+-]{1,})?[@]([a-zA-Z0-9]{1,}[.][a-z]{2,3})([.][a-z]{2,3})?$"
	conditionCheck
}

#FUNCTION OF VALID MOBILE NUMBER
function mobileNumber()
{
 	
	read -p "             Enter Mobile number :" value
	regexPattern="^[0-9]{2}[ ][0-9]{10}$"
	conditionCheck
}

#FUNCTION OF VALID PASSWORD HAVING EXACTLY ONE SPECIAL CHARACTER
function password()
{
	
	read -p "             Enter Pasword :" value
	regexPattern="^(?=.{8})(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9]*[^A-Za-z0-9][A-Za-z0-9]*$"
	conditionCheck
}

#FUNCTIONS CALL
firstName
lastName
email
mobileNumber
password
