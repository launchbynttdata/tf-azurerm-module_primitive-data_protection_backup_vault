variable "name" {
  description = "Backup vault name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the backup vault is created."
  type        = string
}

variable "location" {
  description = "Azure region where the backup vault is created."
  type        = string
}

variable "datastore_type" {
  description = "Type of datastore used by the backup vault."
  type        = string
  default     = "VaultStore"
}

variable "redundancy" {
  description = "Storage redundancy used by the backup vault."
  type        = string
  default     = "LocallyRedundant"
}

variable "retention_duration_in_days" {
  description = "Number of days that soft-deleted backup data is retained."
  type        = number
  default     = 14
}

variable "soft_delete" {
  description = "Soft-delete state for the backup vault."
  type        = string
  default     = "On"
}

variable "identity" {
  description = "Managed identity configuration for the backup vault."
  type = object({
    type = string
  })
  default = null
}

variable "tags" {
  description = "Tags applied to the backup vault."
  type        = map(string)
  default     = {}
}
