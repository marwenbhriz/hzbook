variable "client_id" {
  description = "AKS Cluster service principal id"
}

variable "client_password" {
  description = "AKS Cluster service principal password"
}

variable "resource_group_name" {
  type    = string
  default = "rg-hzbook"
}

variable "location" {
  type    = string
  default = "japaneast"
}

variable "cluster_name" {
  type    = string
  default = "hzbook"
}
