variable "public_ip_name" {
    type    = string
}
variable "resource_group_name" {
    type    = string
}
variable "location"    {
    type    = string
}
variable  "allocation_method" {
    type    = string
}
variable "public_ip2_name"{
    type=string
}
variable "public_ip3_name" {
    type=string
}
resource "azurerm_public_ip" "databrick-cluster-public-ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"  
  allocation_method   = var.allocation_method
}

resource "azurerm_public_ip" "databrick-cluster-public-ip-lb" {
  name                = var.public_ip2_name
  location            = var.location
  resource_group_name = var.resource_group_name  
  allocation_method   = var.allocation_method
}

resource "azurerm_public_ip" "databrick-cluster-public-ip-fw" {
  name                = var.public_ip3_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"    
  allocation_method   = var.allocation_method
}

output "public_ip_address_id"{
    value=azurerm_public_ip.databrick-cluster-public-ip.id

}

output "public_ip2_address_id"{
    value=azurerm_public_ip.databrick-cluster-public-ip-lb.id

}
output "public_ip3_address_id"{
    value=azurerm_public_ip.databrick-cluster-public-ip-fw.id

}