resource "azurerm_kubernetes_cluster" "hexa" {
  name                = var.cluster_name
  location            = azurerm_resource_group.hexa.location
  resource_group_name = azurerm_resource_group.hexa.name
  dns_prefix          = "${azurerm_resource_group.hexa.name}-${var.cluster_name}"

  default_node_pool {
    name       = "nodepoolig"
    node_count = 2
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

resource "azurerm_kubernetes_cluster_node_pool" "nodepoolhx" {
  name                  = "nodepoolhx"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.hexa.id
  vm_size               = "Standard_B4ms"
  node_count            = 2
}

resource "azurerm_kubernetes_cluster_node_pool" "nodepooldbs" {
  name                  = "nodepooldbs"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.hexa.id
  vm_size               = "Standard_B4ms"
  node_count            = 2
}

resource "azurerm_kubernetes_cluster_node_pool" "nodepoolmg" {
  name                  = "nodepoolmg"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.hexa.id
  vm_size               = "Standard_D4s_v3"
  node_count            = 1
}

resource "azurerm_kubernetes_cluster_node_pool" "nodepoolarg" {
  name                  = "nodepoolarg"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.hexa.id
  vm_size               = "Standard_D4s_v3"
  node_count            = 1
}
