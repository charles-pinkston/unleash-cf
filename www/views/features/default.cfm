<h1>Features</h1>
<cfoutput>
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-success">
				<div class="panel-heading">Active Features</div>
				<div class="panel-body">
					<ul>
						<cfloop array=#rc.activeFeatures# index="feature">
								<li>#feature.name# - #feature.description#</li>
						</cfloop>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-danger">
				<div class="panel-heading">Inactive Features</div>
				<div class="panel-body">
					<ul>
						<cfloop array=#rc.inactiveFeatures# index="feature">
							<li>#feature.name# - #feature.description#</li>
						</cfloop>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div>
		<h2>All Features (RAW)</h2>
		<cfscript>
			dump(var=rc.features, expand=false);
		</cfscript>
	</div>
</cfoutput>
