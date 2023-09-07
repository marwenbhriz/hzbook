resource "azurerm_kubernetes_cluster" "hzbook" {
  name                = var.cluster_name
  location            = azurerm_resource_group.hzbook.location
  resource_group_name = azurerm_resource_group.hzbook.name
  dns_prefix          = "${azurerm_resource_group.hzbook.name}-${var.cluster_name}"

  default_node_pool {
    name       = "nodepoolhz"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  role_based_access_control {
    enabled = true
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_password
  }
}

