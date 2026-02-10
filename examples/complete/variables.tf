variable "resource_group_name" {
  type = string
}

variable "vault_name" {
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

variable "soft_delete" {
  type    = string
  default = "On"
}

variable "retention_duration_in_days" {
  type    = number
  default = 14
}

variable "tags" {
  type    = map(string)
  default = {}
}
