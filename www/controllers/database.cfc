component accessors=true displayname="database controller" {

	property unleashDAOService;

	public void function default(struct rc = {}) {
		rc.unleash_data = unleashDAOService.verifyDBData();
	}
}
