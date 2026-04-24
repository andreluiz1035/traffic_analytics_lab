provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "nw_rg" {
  name     = var.network_watcher_rg_name
  location = var.location
}

resource "azurerm_network_watcher" "nw" {
  name                = var.network_watcher_name
  location            = var.location
  resource_group_name = azurerm_resource_group.nw_rg.name
}