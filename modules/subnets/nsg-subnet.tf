variable "nsg_id"{
    type=string
}
resource "azurerm_subnet_network_security_group_association" "databrick-cluster-nsga" {
  subnet_id                 = azurerm_subnet.databrick-cluster-sn.id
  network_security_group_id = var.nsg_id
}
