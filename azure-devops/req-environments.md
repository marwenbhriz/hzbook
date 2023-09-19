# Environments

Under `Pipelines` > `Environments` create the following environments:

* New Environment:
  * Name: _<environment_name>_
  * Resource: `Kubernetes`
  * Provider: `Azure Kubernetes Service`
  * Azure Subscription: _\<subscription>_
  * Cluster: _\<cluster>_
  * Namespace: `Existing` > `default`

> Note: This will create an auto-generated service connection in `Project Settings`.