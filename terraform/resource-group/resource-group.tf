# Create a resource group
resource "azurerm_resource_group" "hexacommon" {
  name     = var.resource_group_name
  location = var.location
}
