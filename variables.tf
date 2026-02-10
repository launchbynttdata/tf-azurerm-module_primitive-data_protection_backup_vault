variable "enabled" {
  description = "Create the backup vault"
  type        = bool
  default     = true
}

variable "name" {
  description = "Backup vault name"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "datastore_type" {
  type    = string
  default = "VaultStore"
}

variable "redundancy" {
  type    = string
  default = "LocallyRedundant"
}

variable "retention_duration_in_days" {
  type    = number
  default = 14
}

variable "soft_delete" {
  type    = string
  default = "On"
}

variable "identity" {
  type = object({
    type = string
  })
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
