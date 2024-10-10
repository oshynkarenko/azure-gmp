terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.92.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "azure_gmp_rg" {
  name     = "rg-azure-gmp-ne-001"
  location = "northeurope"
}

resource "azurerm_storage_account" "azure_gmp_storage_account" {
  name                     = "oshynkarenkone001"
  location                 = "northeurope"

  account_replication_type = "LRS"
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  resource_group_name      = azurerm_resource_group.azure_gmp_rg.name

  static_website {
    index_document     = "index.html"
  }
}
