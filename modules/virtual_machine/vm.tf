

resource "azurerm_windows_virtual_machine" "databrick-cluster-vm" {
  name                = var.vm_name
  depends_on          = [azurerm_network_interface.databrick-cluster-nic]
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = var.vm_user
  admin_password      = var.vm_password
  network_interface_ids = [
    var.network_interface_id,
  ]

  os_disk {
    caching              = var.vm_caching
    storage_account_type = var.vm_storage_account_type 
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}





