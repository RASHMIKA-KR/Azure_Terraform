variable "bastion_name" {
    type    = string
}
variable "resource_group_name" {
    type    = string
}
variable "location"  {
    type    = string
} 
variable "public_ip_address_id" {
    type    = string
}
variable "vnet_name" {
    type    = string
}
variable "subnet_id" {
    type    = string
}

resource "azurerm_subnet" "databrick-cluster-sn2" {
  name                 = "AzureBastionSubnet"
  resource_group_name =   var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_bastion_host" "databrick-cluster-bastion" {
  name                = var.bastion_name
  depends_on = [azurerm_subnet.databrick-cluster-sn2]
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_configuration {
    name = "configuration"
    subnet_id=azurerm_subnet.databrick-cluster-sn2.id
    public_ip_address_id=var.public_ip_address_id
  }
}

output "subnet2_id" {
  value = azurerm_subnet.databrick-cluster-sn2.id
}

output "bastion_host_id" {
    value = azurerm_bastion_host.databrick-cluster-bastion.id
}