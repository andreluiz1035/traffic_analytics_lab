provider "azurerm" {
  features {}
}

############################
# RG existente
############################
data "azurerm_resource_group" "nw_rg" {
  name = var.network_watcher_rg_name
}

############################
# Network Watcher existente
############################
data "azurerm_network_watcher" "nw" {
  name                = var.network_watcher_name
  resource_group_name = data.azurerm_resource_group.nw_rg.name
}