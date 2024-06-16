

resource "azurerm_network_interface" "databrick-cluster-nic" {
  name                = var.interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

output "network_interface_id"{
    value=azurerm_network_interface.databrick-cluster-nic.id
}