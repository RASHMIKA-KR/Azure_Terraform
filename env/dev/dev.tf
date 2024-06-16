terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }

  backend "azurerm" {
    resource_group_name  = "task"
    storage_account_name = "backendworking"
    container_name       = "backendcontainer"
    key                  = "dev/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "databricks" {
  azure_workspace_resource_id = module.databricks_workspace.databricks_workspace_id
  host                        = module.databricks_workspace.databricks_host
}

module "resource_group" {
  source   = "../../modules/resource_group"
  resource_group_name      = var.resource_group_name  
  location = var.location
}

module "databricks_workspace" {

  source              = "../../modules/databricks_workspace"
  workspace_name      = var.workspace_name  
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}

module "virtual_network" {

  source              = "../../modules/virtual_network"
  vnet_name           = var.vnet_name  
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}

module "subnets" {
  source              = "../../modules/subnets"
  subnet_name             = var.subnet_name 

  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.virtual_network.vnet_name
  nsg_id            = module.network_security_group.nsg_id
}

module "network_security_group" {
  source              = "../../modules/network_security_group"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.virtual_network.vnet_name
  nsg_name            = var.nsg_name
  nsgr_in_name         = var.nsgr_in_name 
  nsgr_out_name        = var.nsgr_out_name 
}


module "public_ip" {
  source          = "../../modules/public_ip"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  public_ip_name      =var.public_ip_name
  public_ip2_name      =var.public_ip2_name
  public_ip3_name      =var.public_ip3_name
  allocation_method   = var.allocation_method
}


module "bastion_host" {
  source          = "../../modules/bastion_host"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_name =module.virtual_network.vnet_name
  public_ip_address_id = module.public_ip.public_ip_address_id
  subnet_id         = module.bastion_host.subnet2_id
  bastion_name        = var.bastion_name
}

module "load_balancer"{
  source        ="../../modules/load_balancer"
  location      = var.location
  public_ip2_name      =var.public_ip2_name
  resource_group_name = module.resource_group.resource_group_name
  lb_pool=var.lb_pool
  lb_probe=var.lb_probe
  lb_name=var.lb_name
  public_ip2_address_id = module.public_ip.public_ip2_address_id
}

module "firewall"{
  source          = "../../modules/firewall"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_name =module.virtual_network.vnet_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  subnet_id         = module.firewall.subnet_id
  public_ip_address_id = module.public_ip.public_ip3_address_id
  firewall_name=var.firewall_name
}

module "virtual_machine"{
  source          = "../../modules/virtual_machine"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  interface_name=var.interface_name
  subnet_id=module.subnets.subnet_id
  vm_name=var.vm_name
  vm_user=var.vm_user
  vm_password=var.vm_password
  network_interface_id=module.virtual_machine.network_interface_id
  vm_caching=var.vm_caching
  vm_storage_account_type=var.vm_storage_account_type
}