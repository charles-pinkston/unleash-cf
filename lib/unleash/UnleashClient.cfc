/* This component manages the features.  It requires a connection to the Unleash server */

component accessors=true displayname="Unleash Client SDK" {

	property name="unleashManager" type="UnleashManager";

	public UnleashClient function init(required UnleashManager um){
		setUnleashManager(arguments.um);
		return this;
	}

	public any function getFeatures(){
		var result = [];
		var requestFromServer = requestFeatures();
		if(local.requestFromServer.keyExists('filecontent')){
			var response = deserializeJSON(local.requestFromServer.filecontent);
		}
		result = local.response.features;

		return(result);
	}

	public array function getActiveFeatures(required array features){
		return arguments.features.reduce(function(active, feat){
			if(feat.enabled){
				active.append(feat);
			}
			return active;
			},[]
		);
	}

	public array function getInactiveFeatures(required array features){
		return arguments.features.reduce(function(active, feat){
			if(!feat.enabled){
				active.append(feat);
			}
			return active;
			},[]
		);
	}

	private any function requestFeatures(){
		cfhttp(method = "GET", url = unleashManager.getUnleashHostConnectionString() & "/api/client/features", result = "result") {
			cfhttpparam(type = "header", name = "UNLEASH-APPNAME", value = unleashManager.getAppName());
			cfhttpparam(type = "header", name = "UNLEASH-INSTANCEIF", value = unleashManager.getInstanceID());
		}
		return result;
	}

}
