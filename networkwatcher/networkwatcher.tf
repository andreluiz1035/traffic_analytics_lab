provider "azurerm" {
  features {}
}

############################
# RG já existente (NÃO criar)
############################
data "azurerm_resource_group" "nw_rg" {
  name = var.network_watcher_rg_name
}

############################
# Network Watcher
############################
resource "azurerm_network_watcher" "nw" {
  name                = var.network_watcher_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.nw_rg.name
}