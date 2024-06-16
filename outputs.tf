output "resource_group_id" {
  value = modules.resource_group.resource_group_id
}

output "databricks_workspace_resource_id" {
  value = modules.databricks_workspace.databricks_workspace_id
}

output "databricks_host" {
  value = modules.databricks_workspace.databricks_host
}

output "vnet_id" {
  value = modules.virtual_network.vnet_id
}

output "subnet_id" {
  value = modules.subnets.subnet_id
}

output "nsg_id" {
  value = modules.network_security_group.nsg_id
}

output "nsg_rule_id" {
  value = modules.network_security_group.nsg_rule_id
}