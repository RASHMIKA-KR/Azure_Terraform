
# Inbound Rule
resource "azurerm_network_security_rule" "databrick-cluster-nsr-inbound" {
  name                        = var.nsgr_in_name 
  depends_on = [azurerm_network_security_group.databrick-cluster-sg]
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
}

output "nsg_rule_in_id" {
  value = azurerm_network_security_rule.databrick-cluster-nsr-inbound.id
}