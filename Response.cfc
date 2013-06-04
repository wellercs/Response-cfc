component displayname="Response Object" accessors="true" {
	property name="data" type="any" required="false" getter="true";
	property name="errorCode" type="numeric" required="false" getter="true";
	property name="errorDetail" type="string" required="false" getter="true";
	property name="errorMessage" type="string" required="false" getter="true";
	property name="errors" type="array" required="false" getter="true";
	property name="statusCode" type="numeric" required="false" getter="true";
	property name="statusText" type="string" required="false" getter="true";
	property name="success" type="boolean" required="false" getter="true";

	this.setData("");
	this.setErrorCode(0);
	this.setErrorDetail("");
	this.setErrorMessage("");
	this.setErrors([]);
	this.setStatusCode(200);
	this.setStatusText("OK");
	this.setSuccess(true);
	
	/**
	* @hint I initialize the component
	*/
	public Response function init() {
		return this;
	}
	
	/**
	* @hint I append an error element to the errors array
	* @theError I am the error message to append onto the errors array
	*/
	public void function appendError( required string theError ) {
		if ( len(trim(arguments.theError)) ) {
			arrayappend(this.errors, arguments.theError);
		}
	}

	/**
	* @hint I return the current state of the bean
	* @format I am the return format of the response
	*/		
	public any function getResponse( string format="json" ) {
		if ( structKeyExists(arguments,"format") and arguments.format is "json" ) {
			return serializeJSON(this);	
		}
		else {
			return this;
		}
	}

	/**
	* @hint I catch it if someone passes in a bad method name
	*/		
	public any function onMissingMethod( string missingMethodName, struct missingMethodArguments ) {}
}