# Azure Devops

## CI pipeline aka Azure Pipeline

### Prerequisites

* Github access to repositories (saved as service connection in `Project Settings`)
* Docker Registry [Service Connection](./req-service-connections.md)
* [Environment](./req-environments.md) to kubernetes cluster
* [Variable groups](./req-variable-groups.md): `azure-go-module-netrc`, `deploy-variables`, `docker-variables`

### Create a new CI Pipeline

Under `Pipelines` > `Pipelines` create a new one by following these steps:

* Connect: `Github`
* Select a repository:
  * If you cannot find your repository, select `connection` under "You may also select a specific connection".
  * Use an existing connection: _<github_service_connection>_
* Review: `Run` > `Save`
