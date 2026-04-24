provider "azurerm" {
  features {}
}

# Referência ao RG existente
data "azurerm_resource_group" "rg" {
  name = "rg-traffic-lab"
}

# Network Watcher
resource "azurerm_network_watcher" "nw" {
  name                = "NetworkWatcher_${var.location}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
}