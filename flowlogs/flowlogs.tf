########################################
# Provider
########################################
provider "azurerm" {
  features {}
}

########################################
# Network Watcher existente
########################################
data "azurerm_network_watcher" "nw" {
  name                = "NetworkWatcher_brazilsouth"
  resource_group_name = "NetworkWatcherRG"
}

########################################
# NSG existente
########################################
data "azurerm_network_security_group" "nsg" {
  name                = "nsg-traffic-lab"
  resource_group_name = "rg-traffic-lab"
}

########################################
# Storage Account existente
########################################
data "azurerm_storage_account" "sa" {
  name                = "stotrafficflow1035"
  resource_group_name = "rg-traffic-lab"
}

########################################
# Log Analytics Workspace existente
########################################
data "azurerm_log_analytics_workspace" "law" {
  name                = "SEU_WORKSPACE_NOME"
  resource_group_name = "SEU_WORKSPACE_RG"
}

########################################
# Flow Logs
########################################
resource "azurerm_network_watcher_flow_log" "flowlog" {
  name                 = "flowlog-nsg"
  network_watcher_name = data.azurerm_network_watcher.nw.name
  resource_group_name  = data.azurerm_network_watcher.nw.resource_group_name

  target_resource_id = data.azurerm_network_security_group.nsg.id
  storage_account_id = data.azurerm_storage_account.sa.id

  enabled = true
  version = 2

  retention_policy {
    enabled = true
    days    = 7
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.law.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.law.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.law.id
    interval_in_minutes   = 10
  }
}