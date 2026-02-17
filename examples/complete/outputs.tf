output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.resource_group.name
}

output "backup_vault_name" {
  description = "Name of the backup vault"
  value       = module.backup_vault.vault_name
}

output "backup_vault_id" {
  description = "ID of the backup vault"
  value       = module.backup_vault.vault_id
}
output "backup_vault_identity" {
  description = "Identity of the backup vault"
  value       = module.backup_vault.identity
}
