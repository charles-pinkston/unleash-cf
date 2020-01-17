component name="main" output=false accessors=true {

	public void function default(struct rc = {}) {
		param name="rc.skeletonType" default="Basic FW/1 Skeleton";
//		rc.appData = createObject("component", "Application");
//		rc.testDB = queryExecute("SELECT * FROM client_applications");
		rc.unleashManager = new lib.unleash.UnleashManager({
			appName:"demo2",
			instanceId:"local",
			sdkVersion: "cf-unleash:0.0.1",
			strategies:["default"]
		});
		//dump(var=rc, expand=false);
		//rc.registration = rc.unleashManager.register();
		//dump(rc.registration);
		rc.unleash = new lib.unleash.UnleashClient(rc.unleashManager);
		//dump(rc.unleash);
		//dump(rc.unleash.getFeatures());
	}
}
