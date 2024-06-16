# modules/vnet.tf

variable "vnet_name" {
  type    = string
}

variable "resource_group_name" {
  type    = string
}

variable "location" {
  type    = string
}

resource "azurerm_virtual_network" "databrick-cluster-vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags = {
    environment = "dev"
  }
}

output "vnet_id" {
  value = azurerm_virtual_network.databrick-cluster-vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.databrick-cluster-vnet.name
}
