<cfcomponent>
	<cfset this.name				= "sessionSwapTestApplication">
	<cfset this.sessionmanagement	= true>
	<cfset this.sessiontimeout		= CreateTimeSpan(0,0,30,0)>
	<cfset this.applicationtimeout	= CreateTimeSpan(1, 0, 0, 0)>
	<cfset this.setDomainCookies	= true>
	<cfset this.clientmanagement	= false>
	
	<cffunction name="onApplicationStart" returntype="void" output="false">
		<cfset application.dbdsn = "blayter_demo">
	</cffunction>
	
	<cffunction name="onRequestStart" returnType="void" output="Yes">
		<cf_sessionswap type="read" datasource="#application.dbdsn#">
	</cffunction>

	<cffunction name="onRequestEnd" returnType="void" output="Yes">
		<cf_sessionswap type="write" datasource="#application.dbdsn#">
		<hr/>
		<cfdump var="#request.sessionSwap#" label="request.sessionSwap">
	</cffunction>
</cfcomponent>