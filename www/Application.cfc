component extends="lib.framework.one" output="false" {
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0);
	this.datasource = "unleashDB";
	//this.datasources["unleashdb"] = {
		//class: 'org.postgresql.Driver'
		//, bundleName: 'org.postgresql.jdbc42'
		//, bundleVersion: '9.4.1212'
		//, connectionString: 'jdbc:postgresql://localhost:5432/unleash'
		//, username: 'unleash_user'
		//, password: "encrypted:6b079fed64b8909554682dd96659935d198d2e76646ad899"
	//};
	this.setClientCookies = true;
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 30, 0);

	// FW/1 settings
	variables.framework = {
		action = 'action',
		defaultSection = 'main',
		defaultItem = 'default',
		generateSES = false,
		SESOmitIndex = false,
		diEngine = "di1",
		diComponent = "lib.framework.ioc",
		diLocations = "model, controllers",
        diConfig = { },
		reload = 'reload',
		reloadApplicationOnEveryRequest = true,
        routes = [ ]
	};

	public void function setupSession() {  }

	public void function setupRequest() {  }

	public void function setupView() {  }

	public void function setupResponse() {  }

	public string function onMissingView(struct rc = {}) {
		return "Error 404 - Page not found.";
	}
}
