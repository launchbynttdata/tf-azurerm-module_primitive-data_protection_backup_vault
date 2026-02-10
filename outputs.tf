output "vault_id" {
  value = try(azurerm_data_protection_backup_vault.backup_vault[0].id, null)
}

output "vault_name" {
  value = try(azurerm_data_protection_backup_vault.backup_vault[0].name, null)
}

output "identity" {
  value = try(azurerm_data_protection_backup_vault.backup_vault[0].identity, null)
}
