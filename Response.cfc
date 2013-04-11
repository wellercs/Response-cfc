<cfcomponent displayname="Response Object" output="false">

	<cffunction name="init" access="public" output="false" returntype="Response" hint="I initialize the component">
		<cfscript>
			variables.response.data = "";
			variables.response.errorCode = 0;
			variables.response.errorDetail = "";
			variables.response.errorMessage = "";
			variables.response.errors = [];
			variables.response.statusCode = 200;
			variables.response.statusText = "OK";
			variables.response.success = true;
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="getData" output="false" access="public" returntype="any">
		<cfreturn variables.response.data>
	</cffunction>
	<cffunction name="setData" output="false" access="public" returntype="void">
		<cfargument name="data" required="true">
		<cfset variables.response.data = arguments.data>
	</cffunction>

	<cffunction name="getErrorCode" output="false" access="public" returntype="any">
		<cfreturn variables.response.errorCode>
	</cffunction>
	<cffunction name="setErrorCode" output="false" access="public" returntype="void">
		<cfargument name="errorCode" required="true">
		<cfset variables.response.errorCode = arguments.errorCode>
	</cffunction>

	<cffunction name="getErrorDetail" output="false" access="public" returntype="any">
		<cfreturn variables.response.errorDetail>
	</cffunction>
	<cffunction name="setErrorDetail" output="false" access="public" returntype="void">
		<cfargument name="errorDetail" required="true">
		<cfset variables.response.errorDetail = arguments.errorDetail>
	</cffunction>

	<cffunction name="getErrorMessage" output="false" access="public" returntype="any">
		<cfreturn variables.response.errorMessage>
	</cffunction>
	<cffunction name="setErrorMessage" output="false" access="public" returntype="void">
		<cfargument name="errorMessage" required="true">
		<cfset variables.response.errorMessage = arguments.errorMessage>
	</cffunction>

	<cffunction name="getErrors" output="false" access="public" returntype="any">
		<cfreturn variables.response.errors>
	</cffunction>
	<cffunction name="setErrors" output="false" access="public" returntype="void">
		<cfargument name="errors" required="true">
		<cfset variables.response.errors = arguments.errors>
	</cffunction>
	<cffunction name="appendError" output="false" access="public" returntype="void">
		<cfargument name="theError" type="string" required="true">
		<cfif len(trim(arguments.theError))>
			<cfset arrayappend(variables.response.errors, arguments.theError)>
		</cfif>
	</cffunction>

	<cffunction name="getStatusCode" output="false" access="public" returntype="any">
		<cfreturn variables.response.statusCode>
	</cffunction>
	<cffunction name="setStatusCode" output="false" access="public" returntype="void">
		<cfargument name="statusCode" required="true">
		<cfset variables.response.statusCode = arguments.statusCode>
	</cffunction>

	<cffunction name="getStatusText" output="false" access="public" returntype="any">
		<cfreturn variables.response.statusText>
	</cffunction>
	<cffunction name="setStatusText" output="false" access="public" returntype="void">
		<cfargument name="statusText" required="true">
		<cfset variables.response.statusText = arguments.statusText>
	</cffunction>

	<cffunction name="getSuccess" output="false" access="public" returntype="any">
		<cfreturn variables.response.success>
	</cffunction>
	<cffunction name="setSuccess" output="false" access="public" returntype="void">
		<cfargument name="success" required="true">
		<cfset variables.response.success = arguments.success>
	</cffunction>

	<cffunction name="getResponse" output="false" access="public" returntype="any" hint="Returns the current state of the bean.">
        <cfargument name="format" type="string" required="false" default="json" hint="I am the return format of the response.">

		<cfset var local = {}>

		<cfset local.returnobject = variables.response>

		<cfif StructKeyExists(arguments,"format") AND arguments.format IS "json">
			<cfset local.returnobject = SerializeJSON(variables.response)>
		</cfif>

        <cfreturn local.returnobject />
    </cffunction>

	<cffunction name="onMissingMethod" hint="I catch it if someone passes in a bad method name">
		<cfargument name="missingMethodName" type="string">
	    <cfargument name="missingMethodArguments" type="struct">

	</cffunction>

</cfcomponent>