component accessors=true{

	public any function default(required struct rc){
		local.um = new lib.unleash.UnleashManager({});
		rc.unleash = new lib.unleash.UnleashClient(local.um);
		rc.features = rc.unleash.getFeatures();
		rc.activeFeatures = rc.unleash.getActiveFeatures(rc.features);
		rc.inactiveFeatures = rc.unleash.getInactiveFeatures(rc.features);
	}

}
