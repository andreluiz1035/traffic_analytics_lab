variable "location" {
  description = "Região do Azure"
  type        = string
  default     = "brazilsouth"
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "vm_name" {
  description = "vm-traffic-lab"
  type        = string
}

variable "admin_username" {
  description = "Usuário administrador"
  type        = string
}

variable "admin_password" {
  description = "Senha do administrador"
  type        = string
  sensitive   = true
}