variable "location" {
  description = "Região onde o Network Watcher será criado"
  type        = string
  default     = "brazilsouth"
}

variable "network_watcher_name" {
  description = "Nome do Network Watcher"
  type        = string
  default     = "NetworkWatcher_brazilsouth"
}

variable "network_watcher_rg_name" {
  description = "Nome do Resource Group do Network Watcher"
  type        = string
  default     = "NetworkWatcherRG"
}