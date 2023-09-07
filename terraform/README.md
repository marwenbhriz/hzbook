# Terraform

## Requirements

* configured Azure CLI

## Set up azure resources

Create resources in the following order and execute commands below:

1. Resource Group
2. Registry
3. AKS

```sh
cd <folder>

terraform init

terraform apply
```

> Note: Don't forget to configure variables for each resource, respectively.
