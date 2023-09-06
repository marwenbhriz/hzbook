provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "hexa" {
  name     = var.resource_group_name
  location = var.location
}
