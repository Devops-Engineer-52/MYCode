
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "todu-rg93"
    storage_account_name = "mystrgbackend93"
    container_name       = "backendcontainer93"
    key                  = "todu.tfstate"
    subscription_id = "68091150-801e-4498-8be2-e5d4bcf9919c"

  }


}

provider "azurerm" {
  subscription_id = "68091150-801e-4498-8be2-e5d4bcf9919c"
  features {}

}
