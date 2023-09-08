# Variable Groups

Under `Pipelines` > `Library` create the following variable groups:


* `deploy-variables`:
  * `deployEnvironment_1`: _<environment_name>.<kubernetes_namespace>_
  * `nodeSelectorAgentPool`: `nodepoolhx`
* `docker-variables`:
  * `containerRegistry`: _<acr_name>_`.azurecr.io`
  * `dockerRegistryServiceConnection`: _<docker_registry_service_connection_name>_
