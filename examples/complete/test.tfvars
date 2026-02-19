resource_names_map = {
  resource_group = {
    name       = "rg"
    max_length = 80
  }

  storage_account = {
    name       = "st"
    max_length = 24
  }

  recovery_vault = {
    name       = "rsv"
    max_length = 50
  }
}

logical_product_family  = "launch"
logical_product_service = "backup"
class_env               = "test"
instance_env            = 0
instance_resource       = 0

resource_group_name = "backup-rg"
vault_name          = "data-backup-vault"

location = "eastus"

tags = {
  environment = "test"
  terraform   = "true"
}
