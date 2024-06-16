# modules/subnets.tf

variable "subnet_name" {
  type    = string
}

variable "resource_group_name" {
  type    = string
}

variable "vnet_name" {
  type    = string
}

resource "azurerm_subnet" "databrick-cluster-sn" {
  name                 = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.1.0/24"]
}


output "subnet_id" {
  value = azurerm_subnet.databrick-cluster-sn.id
}


