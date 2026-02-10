resource "azurerm_data_protection_backup_vault" "backup_vault" {
  count = var.enabled ? 1 : 0

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  datastore_type = var.datastore_type
  redundancy     = var.redundancy

  soft_delete                = var.soft_delete
  retention_duration_in_days = var.retention_duration_in_days

  tags = var.tags

  dynamic "identity" {
    for_each = var.identity == null ? [] : [var.identity]

    content {
      type = identity.value.type
    }
  }
}
