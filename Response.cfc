component displayname="Response Object" accessors="true" {
	property name="data" type="any" required="false" getter="true";
	property name="errorCode" type="numeric" required="false" getter="true";
	property name="errorDetail" type="any" required="false" getter="true";
	property name="errorMessage" type="string" required="false" getter="true";
	property name="errors" type="array" required="false" getter="true";
	property name="requestDurationInMilliseconds" type="numeric" required="false" getter="true";
	property name="requestID" type="numeric" required="false" getter="true";
	property name="result" type="any" required="false" getter="true";
	property name="stackTrace" type="string" required="false" getter="true";
	property name="statusCode" type="numeric" required="false" getter="true";
	property name="statusText" type="string" required="false" getter="true";
	property name="subErrorCode" type="numeric" required="false" getter="true";
	property name="success" type="boolean" required="false" getter="true";
	property name="successMessage" type="string" required="false" getter="true";

	this.setData("");
	this.setErrorCode(0);
	this.setErrorDetail("");
	this.setErrorMessage("");
	this.setErrors([]);
	this.setRequestDurationInMilliseconds(0);
	this.setRequestID(0);
	this.setResult([]);
	this.setStackTrace("");
	this.setStatusCode(200);
	this.setStatusText("OK");
	this.setSubErrorCode(0);
	this.setSuccess(true);
	this.setSuccessMessage("");

	/**
	* @hint I initialize the component
	*/
	public Response function init() {
		return this;
	}

	/**
	* @hint I append data to the data property object
	* @newData I am the data to append onto the data property object
	*/
	public void function appendData( required any newData ) {
		if ( isValid("array", this.getData()) ) {
			arrayappend(this.getData(), arguments.newData);
		}
		else if ( isValid("struct", this.getData()) ) {
			structappend(this.getData(), arguments.newData);
		}
	}

	/**
	* @hint I append an error element to the errors array
	* @theError I am the error message to append onto the errors array
	*/
	public void function appendError( required string theError ) {
		if ( len(trim(arguments.theError)) ) {
			arrayappend(this.getErrors(), arguments.theError);
		}
	}

	/**
	* @hint I append an error array to the errors array
	* @theErrors I am the error array to append onto the errors array
	*/
	public void function appendErrors( required array theErrors ) {
		if ( arrayLen(arguments.theErrors) ) {
			arrayappend(this.getErrors(), arguments.theErrors);
		}
	}

	/**
	* @hint I return the current state of the bean
	* @format I am the return format of the response
	* @include_stacktrace I determine whether or not to include the stacktrace in the response.
	* @log_error I determine whether or not to log the error (in BugLogHQ).
	*/		
	public any function getResponse( string format = "json", include_stacktrace = false, log_error = true ) {
		local.responseStruct = {};
		local.responseStruct["data"] = this.getData();
		local.responseStruct["errorCode"] = this.getErrorCode();
		local.responseStruct["errorDetail"] = this.getErrorDetail();
		local.responseStruct["errorMessage"] = this.getErrorMessage();
		local.responseStruct["errors"] = this.getErrors();
		local.responseStruct["requestDurationInMilliseconds"] = this.getRequestDurationInMilliseconds();
		local.responseStruct["requestID"] = this.getRequestID();
		local.responseStruct["result"] = this.getResult();
		local.responseStruct["stackTrace"] = this.getStackTrace();
		local.responseStruct["statusCode"] = this.getStatusCode();
		local.responseStruct["statusText"] = this.getStatusText();
		local.responseStruct["subErrorCode"] = this.getSubErrorCode();
		local.responseStruct["success"] = this.getSuccess();
		local.responseStruct["successMessage"] = this.getSuccessMessage();

		if ( NOT arguments.include_stacktrace ) {
			this.setStackTrace("");
		}

		if ( arguments.format is "json" ) {
			return serializeJSON(this);	
		}
		else if ( arguments.format is "jsonrpc" ) {
			local.responseStruct = {};
			local.responseStruct["id"] = javaCast("int", this.getRequestID());
			local.responseStruct["jsonrpc"] = javaCast("string", "<deleteMe>2.0");
			local.responseStruct["error"]["code"] = javaCast("int", this.getErrorCode());
			local.responseStruct["error"]["message"] = this.getErrorMessage();
			local.responseStruct["error"]["data"] = this.getErrorDetail();
			local.responseStruct["result"] = this.getResult();
			if ( this.getSuccess() ) {
				structDelete(local.responseStruct, "error");
			}
			else {
				structDelete(local.responseStruct, "result");
				if ( NOT this.getErrorCode() ) {
					local.responseStruct["error"]["code"] = 400;
				}
			}
			return replaceNoCase(serializeJSON(local.responseStruct), "<deleteMe>", "", "all");
		}
		else if ( arguments.format is "struct" ) {
			return local.responseStruct;	
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
