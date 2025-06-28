module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = "todu-rg33"
  location            = "centralindia"
}

module "vnet" {
  depends_on          = [module.resource_group]
  source              = "../modules/azurerm_vnet"
  vnet_name           = "todu-vnet33"
  address_space       = ["10.0.0.0/16"]
  location            = "centralindia"
  resource_group_name = "todu-rg33"
}

module "frontend_subnet" {
  depends_on          = [module.vnet]
  source              = "../modules/azurerm_subnet"
  subnet_name         = "frontend-subnet"
  resource_group_name = "todu-rg33"
  vnet_name           = "todu-vnet33"
  address_prefixes    = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on          = [module.vnet]
  source              = "../modules/azurerm_subnet"
  subnet_name         = "backend-subnet"
  resource_group_name = "todu-rg33"
  vnet_name           = "todu-vnet33"
  address_prefixes    = ["10.0.2.0/24"]
}

module "frontend_public_ip" {
  depends_on          = [module.frontend_subnet]
  source              = "../modules/azurerm_public_ip"
  public_ip_name      = "frontend-todu-public-ip"
  location            =  "centralindia"
  resource_group_name = "todu-rg33"
  allocation_method   = "Static"
}

module "backend_public_ip" {
  depends_on          = [module.backend_subnet]
  source              = "../modules/azurerm_public_ip"
  public_ip_name      = "backend-todu-public-ip"
  location            = "centralindia"
  resource_group_name = "todu-rg33"
  allocation_method   = "Static"
}


module "frontend_virtual_machine" {
  depends_on          =   [module.frontend_subnet, module.frontend_public_ip]
  source              = "../modules/azurerm_virtual_machine"
  vm_name             = "frontend-vm33"
  location            =  "centralindia"
  resource_group_name = "todu-rg33"
  vm_size             = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  image_offer         = "0001-com-ubuntu-server-jammy"
  image_sku           = "22_04-lts-gen2"
  image_publisher     = "Canonical"
  image_version       = "latest"
  nic_interface_name  = "frontend-nic"
  subnet_name         = "frontend-subnet"
  vnet_name           = "todu-vnet33"
  public_ip_name      = "frontend-todu-public-ip"
}



module "backend_virtual_machine" {
  depends_on          = [module.backend_subnet, module.backend_public_ip]
  source              = "../modules/azurerm_virtual_machine"
  vm_name             = "backend-vm33"
  location            =  "centralindia"
  resource_group_name = "todu-rg33"
  vm_size             = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  image_offer         = "0001-com-ubuntu-server-focal"
  image_sku           = "20_04-lts" 
  image_publisher     = "Canonical"
  image_version       = "latest"
  nic_interface_name  = "backend-nic"
  subnet_name         = "backend-subnet"
  vnet_name           = "todu-vnet33"
  public_ip_name      = "backend-todu-public-ip"
}
