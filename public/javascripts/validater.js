/****************************************************************
	FILE: validater.js

	DESCRIPTION: This file contains a library of validation functions
  using javascript regular expressions.  Library also contains 
  functions that reformat fields for display or for storage.


  VALIDATION FUNCTIONS:

  validateEmail - checks format of email address
  validateNumeric - checks for valid numeric value
  validateInteger - checks for valid integer value
  validateNotEmpty - checks for blank form field
  validateValue - checks a string against supplied pattern

  FORMAT FUNCTIONS:

  rightTrim - removes trailing spaces from a string
  leftTrim - removes leading spaces from a string
  trimAll - removes leading and trailing spaces from a string
  *******************************************************************/

function validateEmail( strValue) {
/************************************************
DESCRIPTION: Validates that a string contains a
  valid email pattern.

 PARAMETERS:
   strValue - String to be tested for validity

RETURNS:
   True if valid, otherwise false.

REMARKS: Accounts for email with country appended
  does not validate that email contains valid URL
  type (.com, .gov, etc.) or valid country suffix.
*************************************************/
var objRegExp  = /(^[a-z](([a-z_\.]*)([0-9]*))@([a-z_\.]*)([.][a-z]{3})$)|(^[a-z]([a-z_\.]*)@([a-z_\.]*)(\.[a-z]{3})(\.[a-z]{2})*$)/i;

  //check for valid email
  return objRegExp.test(strValue);
}


function  validateNumeric( strValue ) {
/*****************************************************************
DESCRIPTION: Validates that a string contains only valid numbers.

PARAMETERS:
   strValue - String to be tested for validity

RETURNS:
   True if valid, otherwise false.
******************************************************************/
  var objRegExp  =  /(^-?\d\d*\.\d*$)|(^-?\d\d*$)|(^-?\.\d\d*$)/;

  //check for numeric characters
  return objRegExp.test(strValue);
}

function validateInteger( strValue ) {
/************************************************
DESCRIPTION: Validates that a string contains only
    valid integer number.

PARAMETERS:
   strValue - String to be tested for validity

RETURNS:
   True if valid, otherwise false.
**************************************************/
  var objRegExp  = /(^-?\d\d*$)/;

  //check for integer characters
  return objRegExp.test(strValue);
}

function validateNotEmpty( strValue ) {
/************************************************
DESCRIPTION: Validates that a string is not all
  blank (whitespace) characters.

PARAMETERS:
   strValue - String to be tested for validity

RETURNS:
   True if valid, otherwise false.
*************************************************/
   var strTemp = strValue;
   strTemp = trimAll(strTemp);
   if(strTemp.length > 0){
     return true;
   }
   return false;
}

function validateString(strValue){
/****************************************
 * DESCRIPTION: Validates a string pattern
 * 
 * PARAMETERS: strValue: String to be tested.
 *  
 * Returns: true if strValue is a validString otherwise false.
 *  
 *  */
	var objRegExp = new RegExp(/[\\/&/;]/);
	//Check if string is valid
	return objRegExp.test(strValue);
}

function validateValue( strValue, strMatchPattern ) {
/************************************************
DESCRIPTION: Validates that a string a matches
  a valid regular expression value.

PARAMETERS:
   strValue - String to be tested for validity
   strMatchPattern - String containing a valid
      regular expression match pattern.

RETURNS:
   True if valid, otherwise false.
*************************************************/
var objRegExp = new RegExp( strMatchPattern);

 //check if string matches pattern
 return objRegExp.test(strValue);
}


function rightTrim( strValue ) {
/************************************************
DESCRIPTION: Trims trailing whitespace chars.

PARAMETERS:
   strValue - String to be trimmed.

RETURNS:
   Source string with right whitespaces removed.
*************************************************/
var objRegExp = /^([\w\W]*)(\b\s*)$/;

      if(objRegExp.test(strValue)) {
       //remove trailing a whitespace characters
       strValue = strValue.replace(objRegExp, '$1');
    }
  return strValue;
}

function leftTrim( strValue ) {
/************************************************
DESCRIPTION: Trims leading whitespace chars.

PARAMETERS:
   strValue - String to be trimmed

RETURNS:
   Source string with left whitespaces removed.
*************************************************/
var objRegExp = /^(\s*)(\b[\w\W]*)$/;

      if(objRegExp.test(strValue)) {
       //remove leading a whitespace characters
       strValue = strValue.replace(objRegExp, '$2');
    }
  return strValue;
}

function trimAll( strValue ) {
/************************************************
DESCRIPTION: Removes leading and trailing spaces.

PARAMETERS: Source string from which spaces will
  be removed;

RETURNS: Source string with whitespaces removed.
*************************************************/
 var objRegExp = /^(\s*)$/;

    //check for all spaces
    if(objRegExp.test(strValue)) {
       strValue = strValue.replace(objRegExp, '');
       if( strValue.length == 0)
          return strValue;
    }

   //check for leading & trailing spaces
   objRegExp = /^(\s*)([\W\w]*)(\b\s*$)/;
   if(objRegExp.test(strValue)) {
       //remove leading and trailing whitespace characters
       strValue = strValue.replace(objRegExp, '$2');
    }
  return strValue;
}