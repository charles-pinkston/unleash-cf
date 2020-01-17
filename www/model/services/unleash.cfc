component accessors=true output=false displayname="Unleash Client SDK"{

	public boolean function isEnabled(required string name, any unleashContext={}, boolean defaultValue=false){

		local.toggle = toggleRepository.get(arguments.name);
		local.enabled = false;

		if(! structKeyExists(local, toggle)){
			return arguments.defaultValue;
		}else if(! local.toggle.isEnabled){
			return false;
		}else{
			for(local.strategy in local.toggle.strategies){
				local.strategyImpl = strategyImplRepository.get(local.strategy.name);
				
			}
		}

		if (!toggle) {
			return defaultValue;
		} else if (!toggle.isEnabled) {
			return false;
		} else {
			for (var i = 0; i < toggle.strategies.length; i++) {
				//var strategyDef = toggle.strategies[i];
				//var strategyImpl = strategyImplRepository.get(strategyDef.name);
				//if (strategyImpl.isEnabled(toggle.parameters, unleashContext)) {
				return true;
			}
		}
		return false;
	}
}
