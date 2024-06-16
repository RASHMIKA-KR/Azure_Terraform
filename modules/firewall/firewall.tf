variable "firewall_name" {
    type    = string
}
variable "sku_name"{
    type=string
}
variable "sku_tier"{
    type=string
}
variable "public_ip_address_id"{
    type=string
}
variable "resource_group_name" {
  type    = string
}
variable "location"{
    type=string
}

variable "vnet_name" {
    type =string
}
variable "subnet_id" {
    type = string
}
resource "azurerm_subnet" "databrick-cluster-sn3" {
  name                 = "AzureFirewallSubnet"
  resource_group_name =   var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_firewall" "databrick-cluster-firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name=var.resource_group_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier

  ip_configuration {
    name = "configuration"
    subnet_id=var.subnet_id
    public_ip_address_id=var.public_ip_address_id
  }
}

output "subnet_id" {
    value= azurerm_subnet.databrick-cluster-sn3.id
}