############################
# NSG existente
############################
data "azurerm_network_security_group" "nsg" {
  name                = "nsg-traffic-lab"
  resource_group_name = "rg-traffic-lab"
}

############################
# Storage Account existente
############################
data "azurerm_storage_account" "sa" {
  name                = "stotrafficflow1035"
  resource_group_name = "rg-traffic-lab"
}

############################
# Flow Logs
############################
resource "azurerm_network_watcher_flow_log" "flowlog" {
  name                 = "flowlog-nsg"
  network_watcher_name = "NetworkWatcher_brazilsouth"
  resource_group_name  = "NetworkWatcherRG"

  target_resource_id = data.azurerm_network_security_group.nsg.id
  storage_account_id = data.azurerm_storage_account.sa.id

  enabled = true
  version = 2

  retention_policy {
    enabled = true
    days    = 7
  }
}