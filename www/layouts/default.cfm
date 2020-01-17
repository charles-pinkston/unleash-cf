<!DOCTYPE html>

<html>	
	<head>
		<title>Unleash - CF</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<style>
			body { padding-top: 70px; }
		</style>
	</head>
	<body>
		<cfoutput>
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-header">
					<a href="#buildURL('main')#" class="navbar-brand">Unleash - CF</a>
					<ul class="nav navbar-nav">
						<li><a href="#buildURL('features')#">Features</a></li>
						<li><a href="#buildURL('database')#">DB Reference</a></li>
					</ul>
					</div>
				</div>
			</nav>
			<div class="container" role="main">
				<div class="row">
					<div class="col-md-12">
						#body#
					</div>
				</div>
			</div>
		</cfoutput>
		<cfif url.keyExists('debug')>
			<cfscript>
				dump(rc);
			</cfscript>
		</cfif>
	</body>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</html>
