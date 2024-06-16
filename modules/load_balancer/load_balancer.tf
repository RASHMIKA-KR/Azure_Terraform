variable "resource_group_name" {
  type    = string
}

variable "location" {
  type    = string
}

variable "public_ip2_name"{
    type=string
}

variable "lb_name"{
    type=string
}

variable "lb_probe"{
    type=string
}

variable "lb_pool"{
    type=string
}
variable "public_ip2_address_id"{
    type=string
}

resource "azurerm_lb" "databrick-cluster-load-balancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
  frontend_ip_configuration {
    name                 =  var.public_ip2_name
    public_ip_address_id = var.public_ip2_address_id
    
  }
}

resource "azurerm_lb_rule" "databrick-cluster-lb-rule" {
  name                           = var.lb_name
  loadbalancer_id                = azurerm_lb.databrick-cluster-load-balancer.id
  protocol                       = "Udp"
  frontend_port                  = 3380
  backend_port                   = 3380
  frontend_ip_configuration_name = var.public_ip2_name
}

resource "azurerm_lb_probe" "databrick-cluster-lb-probe" {
  name            = var.lb_probe
  loadbalancer_id = azurerm_lb.databrick-cluster-load-balancer.id
  port            = 22
}
resource "azurerm_lb_backend_address_pool" "databrick-cluster-lb-bdap" {
  name            = var.lb_pool
  loadbalancer_id = azurerm_lb.databrick-cluster-load-balancer.id
}
