variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-launch-module_library-resource_name to generate resource names"
  type = map(object({
    name       = string
    max_length = optional(number, 60)
  }))

  default = {
    resource_group = {
      name       = "rg"
      max_length = 80
    }
    recovery_services_vault = {
      name       = "rsv"
      max_length = 50
    }
  }
}

variable "logical_product_family" {
  type        = string
  description = "Logical product family name"
  default     = "launch"
}

variable "logical_product_service" {
  type        = string
  description = "Logical product service name"
  default     = "backup"
}

variable "class_env" {
  type        = string
  description = "Environment classification"
  default     = "test"
}

variable "instance_env" {
  type        = number
  description = "Environment instance number"
  default     = 0
}

variable "instance_resource" {
  type        = number
  description = "Resource instance number"
  default     = 0
}
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
