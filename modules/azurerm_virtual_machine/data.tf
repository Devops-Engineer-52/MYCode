data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}

data "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  
}