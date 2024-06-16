
variable "location" {
  type    = string
  default = "East US"
}

variable "resource_group_name" {
  type    = string
  default = "qa-resource-group"
}

variable "workspace_name" {
  type    = string
  default = "qa-workspace"
}

variable "vnet_name" {
  type    = string
  default = "qa-vnet"
}

variable "subnet_name" {
  type    = string
  default = "qa-subnet"
}


variable "nsg_name" {
  type=string
}
variable "nsgr_out_name" {
  type=string
}
variable "nsgr_in_name" {
  type=string
}

variable "public_ip_name" {
    type    = string
}
variable  "allocation_method" {
    type    = string
}
variable "bastion_name" {
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
variable "lb_rule"{
  type=string
}
variable "firewall_name"{
  type=string
}

variable "public_ip3_name"{
    type=string
}
variable "sku_name"{
  type=string
}
variable "sku_tier"{
  type=string
}

variable "vm_name"{
    type=string
}
variable "vm_user"{
    type=string
}
variable "vm_password"{
    type=string
}

variable "interface_name"{
    type=string
}
variable "vm_caching"{
    type=string
}
variable "vm_storage_account_type"{
    type=string
}
