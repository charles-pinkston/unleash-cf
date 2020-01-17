<cfoutput>
	<h1>Database Data:</h1>
	<cfscript>

		for(tbl in rc.unleash_data){
			echo('<h4>' & tbl & '</h4>');
			dump(rc.unleash_data[tbl]);
			echo('<hr />');
		}
	</cfscript>

</cfoutput>
