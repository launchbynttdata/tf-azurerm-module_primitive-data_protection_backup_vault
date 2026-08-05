output "vault_id" {
  description = "ID of the Data Protection backup vault."
  value       = azurerm_data_protection_backup_vault.backup_vault.id
}

output "vault_name" {
  description = "Name of the Data Protection backup vault."
  value       = azurerm_data_protection_backup_vault.backup_vault.name
}

output "identity" {
  description = "Managed identity assigned to the Data Protection backup vault."
  value       = azurerm_data_protection_backup_vault.backup_vault.identity
}
