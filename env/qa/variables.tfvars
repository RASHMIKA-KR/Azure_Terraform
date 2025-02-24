
location            = "West US"
resource_group_name = "qa-resource-group"
workspace_name      = "qa-workspace"
vnet_name           = "qa-vnet"
subnet              = "qa-subnet"
nsg_name            = "qa-nsg"
nsgr_in_name        = "qa-nsgr-in"
nsgr_out_name       = "qa-nsgr-out"
public_ip_name      = "prod-ip"
public_ip2_name      = "load-balancer-ip"
allocation_method   =  "Static"
bastion_name        = "prod-bastion"
lb_name             = "intact-load-balancer"
lb_rule             = "intact-lb-rule"
lb_probe            = "intact-probe"
lb_pool             = "BackendAddressPool"
firewall_name       = "firewall"
public_ip3_name     = "firwall-ip"
sku_name            = "AZFW_VNet"
sku_tier            = "Standard"