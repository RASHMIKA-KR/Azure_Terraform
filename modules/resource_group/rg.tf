# modules/rg.tf

variable "resource_group_name" {
  type    = string
}

variable "location" {
  type    = string
}

resource "azurerm_resource_group" "databrick-cluster-rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "dev"
  }
}

output "resource_group_id" {
  value = azurerm_resource_group.databrick-cluster-rg.id
}

output "resource_group_name" {
  value = azurerm_resource_group.databrick-cluster-rg.name
}
