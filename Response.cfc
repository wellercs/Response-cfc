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
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.data = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
	</cffunction>

	<cffunction name="getErrorCode" output="false" access="public" returntype="any">
		<cfreturn variables.response.errorCode>
	</cffunction>
	<cffunction name="setErrorCode" output="false" access="public" returntype="void">
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.errorCode = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
	</cffunction>

	<cffunction name="getErrorDetail" output="false" access="public" returntype="any">
		<cfreturn variables.response.errorDetail>
	</cffunction>
	<cffunction name="setErrorDetail" output="false" access="public" returntype="void">
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.errorDetail = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
	</cffunction>

	<cffunction name="getErrorMessage" output="false" access="public" returntype="any">
		<cfreturn variables.response.errorMessage>
	</cffunction>
	<cffunction name="setErrorMessage" output="false" access="public" returntype="void">
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.errorMessage = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
	</cffunction>

	<cffunction name="getErrors" output="false" access="public" returntype="any">
		<cfreturn variables.response.errors>
	</cffunction>
	<cffunction name="setErrors" output="false" access="public" returntype="void">
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.errors = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
	</cffunction>

	<cffunction name="getStatusCode" output="false" access="public" returntype="any">
		<cfreturn variables.response.statusCode>
	</cffunction>
	<cffunction name="setStatusCode" output="false" access="public" returntype="void">
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.statusCode = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
	</cffunction>

	<cffunction name="getStatusText" output="false" access="public" returntype="any">
		<cfreturn variables.response.statusText>
	</cffunction>
	<cffunction name="setStatusText" output="false" access="public" returntype="void">
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.statusText = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
	</cffunction>

	<cffunction name="getSuccess" output="false" access="public" returntype="any">
		<cfreturn variables.response.success>
	</cffunction>
	<cffunction name="setSuccess" output="false" access="public" returntype="void">
		<cfargument name="vlu" required="true">
		<cfif len(trim(arguments.vlu))>
			<cfset variables.response.success = arguments.vlu>
		<cfelse>
			<cfthrow message="'#arguments.vlu#' is not valid"/>
		</cfif>
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