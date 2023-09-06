# Terraform

## Requirements

* configured Azure CLI

## Set up azure resources

Create resources in the following order and execute commands below:

1. Service Principal
2. AKS
4. Resource Group
5. Registry

```sh
cd <folder>

terraform init

terraform apply
```

> Note: Don't forget to configure variables for each resource, respectively.
