output "node_resource_group" {
  value = azurerm_kubernetes_cluster.hexa.node_resource_group
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.hexa.name
}
