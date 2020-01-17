component accessors=true displayname="Unleash Connection Manager"{


	property name="unleashServerProtocol" type="string" default="http" hint="The protocol to access the Unleash Application Server";
	property name="unleashServerHost" type="string" default="unleash" hint="The hostname of the Unleash Application Server";
	property name="unleashServerPort" type="string" default="4242" hint="The port of the Unleash Application Server";

	/*
		Variables used to register an application with the Unleash Server
		https://unleash.github.io/docs/api/client/register
	*/
	property name="appName" type="string" hint="The name of the application as seen by the unleash server.";
	property name="instanceID" type="string" hint="The instance of this application (used to differentiate between multiple versions of the same application)";
	property name="sdkVersion" type="string" hint="Optional field that describes the sdk version (name:version)";
	property name="strategies" type="array" hint="List of strategies implemented by this application";
	property name="started" type="string" hint="When this client started. Should be reported as ISO8601 time";
	property name="interval" type="numeric" default=10000 hint="Interval, in milliseconds, will this client be expected to send metrics";



	/**
	* @hint I create the general connection manager to the Unleash API server.
	*/
	public UnleashManager function init(any config){
		loadConfig(arguments.config);
		return this;
	}

	private UnleashManager function loadConfig(required any config){
		for(arg in arguments.config){
			switch(arg){
				case "appName": {setAppName(arguments.config[arg]); break;}
				case "instanceID": {setInstanceID(arguments.config[arg]); break;}
				case "sdkVersion": {setSDKVersion(arguments.config[arg]); break;}
				case "strategies": {setStrategies(arguments.config[arg]); break;}
				case "started": {setStarted(arguments.config[arg]); break;}
				case "interval": {setInterval(arguments.config[arg]); break;}
			}
		}
		if(isNull(getStarted())){
			setStarted(dateTimeFormat(now(), 'iso8601'));
		};
		return this;
	}

	public any function register(){
		var registration = {
			"appName": getAppName(),
			"instanceId": getInstanceID(),
			"sdkVersion": getSDKVersion(),
  			"strategies": getStrategies(),
			"started": getStarted(),
			"interval": getInterval()
		};
		dump(local.registration);
		dump(serializeJSON(local.registration));
		cfhttp(method="POST", url=getUnleashHostConnectionString() &"/api/client/register", result="result") {
			cfhttpparam(type="header", name="Content-Type", value="application/json");
			cfhttpparam(type="body", value=serializeJSON(local.registration));
		}
		return(result);
	}

	public string function getUnleashHostConnectionString(){
		return getUnleashServerProtocol() & '://' & getUnleashServerHost() & ':' & getUnleashServerPort();
	}

}
