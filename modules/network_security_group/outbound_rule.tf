
# Outbound Rule
resource "azurerm_network_security_rule" "databrick-cluster-nsr-outbound" {
  name                        = var.nsgr_out_name 
  depends_on = [azurerm_network_security_group.databrick-cluster-sg]
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
}
#
output "nsg_rule_out_id" {
  value = azurerm_network_security_rule.databrick-cluster-nsr-outbound.id
}