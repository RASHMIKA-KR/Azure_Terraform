# modules/workspace.tf

variable "workspace_name" {
  type    = string
}

variable "resource_group_name" {
  type    = string
}

variable "location" {
  type    = string
}

resource "azurerm_databricks_workspace" "new_workspace" {
  name            = var.workspace_name  
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"

  tags = {
    environment = "dev"
  }
}

output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.new_workspace.id
}

output "databricks_host" {
  value = azurerm_databricks_workspace.new_workspace.workspace_url
}
