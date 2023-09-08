# HZBooK Simple Django App For Managing Books

## Contents Guide
+ [Prerequisites](#Prerequisites)
    + [Shell Environment and Editor](#Shell)
    + [Installing Kubernetes](#Kubernetes)
    + [Installing Azure CLI](#Azure)
+ [Hzbook](#Hzbook)
    + [Terraform](#Terraform)
    + [Azure Devops](#azure-devops)
    + [Installing Azure CLI](#Azure)

## Prerequisites

HZBooK will require the tooling listed below. Ensure that all of those tools have been installed.

## Kubernetes

Kubectl client [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/). 

Alternatively, you may also go with [Docker Desktop](https://www.docker.com/products/docker-desktop) which is available for Mac and Windows. Docker Desktop provides an option to start a fully functional Kubernetes environment.

## Shell

You can check your shell by running the command `echo $0`.

## Azure CLI

```bash
// install azure cli
brew update && brew install azure-cli

// login to azure account
az login

az aks create -g rg-hzbook -n hzbook --enable-managed-identity --node-count 1 --generate-ssh-keys
az aks install-cli
az aks get-credentials --resource-group rg-hzbook --name hzbook

kubectl create secret docker-registry acr-secret --docker-server=hzbook.azurecr.io --docker-username=hzbook --docker-password=VoLRf74C+jm/Bj8QBw4t+gJAbYZ2Ctv29bLD/t8PsX+ACRBVwH0Z

```

## Terraform

### Requirements

* configured Azure CLI

### Set up azure resources

Create resources in the following order and execute commands below:

1. Resource Group
2. Registry
3. AKS

```sh
cd terraform/<folder>

terraform init

terraform apply
```

## Azure Devops

### CI pipeline aka Azure Pipeline

#### Prerequisites

* Github access to repositories (saved as service connection in `Project Settings`)
* Docker Registry [Service Connection](./azure-devops/req-service-connections.md)
* [Environment](./azure-devops/req-environments.md) to kubernetes cluster
* [Variable groups](./req-variable-groups.md): `deploy-variables`, `docker-variables`

### Create a new CI Pipeline

Under `Pipelines` > `Pipelines` create a new one by following these steps:

* Connect: `Github`
* Select a repository:
  * If you cannot find your repository, select `connection` under "You may also select a specific connection".
  * Use an existing connection: _<github_service_connection>_
* Review: `Run` > `Save`
