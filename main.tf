# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
#  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  
#  client_id       = "8f16031c-d2ac-4d0a-ab7a-f06d825054ef"
  
#  client_secret = "qiM8Q~yCS_5aDMqY68xRZhyFnv5UxaKgwiqD2duw"
  
#  subscription_id = "eeda2866-c5df-4ea0-9204-83e41a294d68"
  
#  tenant_id       = "e4d8fcb7-c2c7-4ba5-a9d0-07e3dee9c257"

  client_id       = "4c156aa9-6750-4c87-97d4-130dfeb197d6"   # appId from output
  client_secret   = "0ND8Q~NFcTZqaiBDiy1gbwz~Sw5lmkRlCXCyCb0l" # password from output
  tenant_id       = "e4d8fcb7-c2c7-4ba5-a9d0-07e3dee9c257"   # tenant from output
  subscription_id = "eeda2866-c5df-4ea0-9204-83e41a294d68"   # your subscription ID
}
  

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}
