variable  "nic_interface_name" {
  description = "The name of the network interface"
  type        = string
}

variable "location" {
  description = "The location of the virtual machine"
  type        = string

  
}

variable  "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_name" {
  description = "The ID of the subnet"
  type        = string  


}

variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}




variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The password for the virtual machine administrator"
  type        = string
  sensitive   = true
  
}

variable "admin_username" {
  description = "The username for the virtual machine administrator"
  type        = string
}



variable "image_publisher" {
  description = "The publisher of the image to use for the virtual machine"
  type        = string  
  
}


variable "image_offer" {
  description = "The offer of the image to use for the virtual machine"
  type        = string  
  
}

variable "image_sku" {
  description = "The SKU of the image to use for the virtual machine"
  type        = string
  
}


variable "image_version" {
  description = "The version of the image to use for the virtual machine"
  type        = string
}



variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}
