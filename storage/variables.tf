variable "storage_account_name" {
  description = "Nome da Storage Account"
  type        = string
  default     = "stotrafficflow1035"
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Região do recurso"
  type        = string
  default     = "brazilsouth"
}

variable "account_tier" {
  description = "Tier da Storage Account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação"
  type        = string
  default     = "LRS"
}

