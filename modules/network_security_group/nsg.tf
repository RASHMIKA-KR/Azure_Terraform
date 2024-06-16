
resource "azurerm_network_security_group" "databrick-cluster-sg" {
  name                = var.nsg_name  
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = {
    environment = "dev"
  }
}

output "nsg_id" {
  value = azurerm_network_security_group.databrick-cluster-sg.id
}
