# Variable Groups

Under `Pipelines` > `Library` create the following variable groups:

* `azure-go-module-netrc`:
  * `githubNetrcToken` (Secret): _<github_email>_
  * `githubNetrcUser` (Secret): _<github_personal_access_token>_
* `deploy-variables`:
  * `deployEnvironment_1`: _<environment_name>.<kubernetes_namespace>_
  * `nodeSelectorAgentPool`: `nodepoolhx`
* `docker-variables`:
  * `containerRegistry`: _<acr_name>_`.azurecr.io`
  * `dockerRegistryServiceConnection`: _<docker_registry_service_connection_name>_

> Note: Github personal access token should be attached to an account with read access to `b-eee/amagi` and `b-eee/linkermodels` github repositories, which are used during docker image build step in `azure-pipelines.yml`.