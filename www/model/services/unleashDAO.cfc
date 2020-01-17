component accessors=true {

	public struct function verifyDBData(numeric limit=5){
		var result = {};
		result.client_applications = this.getClient_Applications(arguments.limit);
		result.client_instances = this.getClient_Instances(arguments.limit);
		result.client_metrics = this.getClient_Metrics(arguments.limit);
		result.events = this.getEvents(arguments.limit);
		result.features = this.getFeatures(arguments.limit);
		result.migrations = this.getMigrations(arguments.limit);
		result.strategies = this.getStrategies(arguments.limit);
		return result;
	}

	public query function getClient_Applications(numeric limit = 0){
		if (arguments.limit) {
			return queryExecute("SELECT * FROM client_applications LIMIT :limit", {limit = {value = arguments.limit, cfsqltype = "cf_sql_numeric"}});
		} else {
			return queryExecute("SELECT * FROM client_applications");
		}
	}

	public query function getClient_Instances(numeric limit = 0){
		if (arguments.limit) {
			return queryExecute("SELECT * FROM client_instances LIMIT :limit", {limit = {value = arguments.limit, cfsqltype = "cf_sql_numeric"}});
		} else {
			return queryExecute("SELECT * FROM client_instances");
		}
	}

	public query function getClient_Metrics(numeric limit = 0){
		if (arguments.limit) {
			return queryExecute("SELECT * FROM client_metrics LIMIT :limit", {limit = {value = arguments.limit, cfsqltype = "cf_sql_numeric"}});
		} else {
			return queryExecute("SELECT * FROM client_metrics");
		}
	}

	public query function getEvents(numeric limit = 0){
		if (arguments.limit) {
			return queryExecute("SELECT * FROM events LIMIT :limit", {limit = {value = arguments.limit, cfsqltype = "cf_sql_numeric"}});
		} else {
			return queryExecute("SELECT * FROM events");
		}
	}

	public query function getFeatures(numeric limit = 0){
		if (arguments.limit) {
			return queryExecute("SELECT * FROM features LIMIT :limit", {limit = {value = arguments.limit, cfsqltype = "cf_sql_numeric"}});
		} else {
			return queryExecute("SELECT * FROM features");
		}
	}

	public query function getMigrations(numeric limit = 0){
		if (arguments.limit) {
			return queryExecute("SELECT * FROM migrations LIMIT :limit", {limit = {value = arguments.limit, cfsqltype = "cf_sql_numeric"}});
		} else {
			return queryExecute("SELECT * FROM migrations");
		}
	}

	public query function getStrategies(numeric limit = 0){
		if (arguments.limit) {
			return queryExecute("SELECT * FROM strategies LIMIT :limit", {limit = {value = arguments.limit, cfsqltype = "cf_sql_numeric"}});
		} else {
			return queryExecute("SELECT * FROM strategies");
		}
	}

}
