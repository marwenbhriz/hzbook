# HZBooK Simple Django App For Managing Books

> Note: To Test this app need to access to UI and trying to post new book and check from mongo UI this book saved `hzbook`.

## Contents Guide
+ [Prerequisites](#Prerequisites)
    + [Shell Environment and Editor](#Shell)
    + [Installing Kubernetes](#Kubernetes)
    + [Installing Azure CLI](#Azure)
+ [Hzbook](#Hzbook)
    + [Terraform](#Terraform)
    + [Azure Devops](#azure-devops)
    + [Database](#Database)
    + [HZBooKapp](#HZBooKapp)

## Prerequisites

HZBooK will require the tooling listed below. Ensure that all of those tools have been installed.

## Kubernetes

Kubectl client [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/). 

Alternatively, you may also go with [Docker Desktop](https://www.docker.com/products/docker-desktop) which is available for Mac and Windows. Docker Desktop provides an option to start a fully functional Kubernetes environment.

## Shell

You can check your shell by running the command `echo $0`.

## Azure CLI

```sh
// install azure cli
brew update && brew install azure-cli

// login to azure account
az login
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

### CI pipeline aks Azure Pipeline

#### Prerequisites

* Github access to repositories (saved as service connection in `Project Settings`)
* Docker Registry [Service Connection](./azure-devops/req-service-connections.md)
* [Environment](./azure-devops/req-environments.md) to kubernetes cluster
* [Variable groups](./azure-devops/req-variable-groups.md): `deploy-variables`, `docker-variables`

### Create a new CI Pipeline

Under `Pipelines` > `Pipelines` create a new one by following these steps:

* Connect: `Github`
* Select a repository:
  * If you cannot find your repository, select `connection` under "You may also select a specific connection".
  * Use an existing connection: _<github_service_connection>_
* Review: `Run` > `Save`

## Database

### Initializing

```sh
# 1. Change to the directory
cd ./db/mongodb/

# 2. Configure hostvm nodes via daemonset and startup-script
kubectl apply -f hostvm-node-configurer-ds.yaml

# 4. Create mongodb service and statefulsets
kubectl apply -f mongo-rs.yaml

# 5. Initialize mongo replicaset
kubectl exec -it mongod-0 -c mongod-container -- mongo

rs.initiate({_id: "MainRepSet", version: 1, members: [
  { _id: 0, host : "mongod-0.mongodb-service.default.svc.cluster.local:27017" },
]});
rs.status(); # wait until become PRIMARY

# 6. Create admin user in mongodb
db.getSiblingDB("admin").createUser({
  user : "jrcsuser",
  pwd  : "password",
  roles: [ { role: "root", db: "admin" } ]
});

# 7. change to the directory
cd ./db/mongoexpress/k8s/

# 8. Create mongo express secret
kubectl apply -f secret/mongoexpress-secret.yml

# 9. Create mongo express deployment
kubectl apply -f deployments/mongoexpress-deployment.yml

# 10. Create mongo express service
kubectl apply -f services/mongoexpress-svc.yml
```

### MongoExpress Access

access to mongo express UI http://4.241.137.148:8081/ and use db creds to access to hzbook database.


## HZBooKapp

### Build adn push

```sh
./do.sh build_push_az $ACR_NAME $Tag
```

### Deploy

```sh
./do.sh deploy_az $APP_ENV

// PS C:\Users\mbenh> kubectl get po
NAME                            READY   STATUS    RESTARTS   AGE
hostvm-configurer-whsfv         1/1     Running   0          39h
hzbook-6f57cb4bc6-d85fl         1/1     Running   0          93m
mongod-0                        1/1     Running   0          36h
mongoexpress-5d4444d585-nfbwt   1/1     Running   0          35h
```

or we can deploy buy trigger our azure devops pipeline; by merging to master branch.

### Access to UI

access to mongo express UI http://4.241.5.63:8000/
