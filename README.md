# tf-azurerm-module_primitive-data_protection_backup_vault

## Overview

This Terraform module creates an Azure Data Protection backup vault with configurable redundancy, retention, soft delete, identity, and tags.

## Usage

See [examples/complete](examples/complete) for a deployable example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run `make configure` from the repository root to confirm that these requirements are met.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines hooks for Terraform formatting, validation, documentation generation, and secret detection. Hooks are installed by `make configure`. Go linting runs through `make lint` locally and in CI.

### Terratest examples

Tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` explicitly target `examples/complete`. The functional suite applies and destroys the example; the readonly suite uses the non-destructive runner against existing infrastructure.

### Local Validation

Before pushing changes:

1. Run `make configure` successfully.
2. Sign in to Azure and select the appropriate subscription.
3. Run the linters:

```shell
make lint
```

4. When Azure credentials are available, run the integration tests (apply, test, and destroy):

```shell
make test
```

Pre-commit validation, linting, and tests also run in CI.

### Review & Merge Process

Open a pull request to `main`. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and drive semantic versioning. Ensure CI passes, address review feedback, and obtain the approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflows are managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to generated skeleton files unless necessary. Use `copier check-update` and `copier update` when refreshing from the skeleton.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_protection_backup_vault.backup_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datastore_type"></a> [datastore\_type](#input\_datastore\_type) | Type of datastore used by the backup vault. | `string` | `"VaultStore"` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | Managed identity configuration for the backup vault. | <pre>object({<br/>    type = string<br/>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region where the backup vault is created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Backup vault name | `string` | n/a | yes |
| <a name="input_redundancy"></a> [redundancy](#input\_redundancy) | Storage redundancy used by the backup vault. | `string` | `"LocallyRedundant"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the backup vault is created. | `string` | n/a | yes |
| <a name="input_retention_duration_in_days"></a> [retention\_duration\_in\_days](#input\_retention\_duration\_in\_days) | Number of days that soft-deleted backup data is retained. | `number` | `14` | no |
| <a name="input_soft_delete"></a> [soft\_delete](#input\_soft\_delete) | Soft-delete state for the backup vault. | `string` | `"On"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the backup vault. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_identity"></a> [identity](#output\_identity) | Managed identity assigned to the Data Protection backup vault. |
| <a name="output_vault_id"></a> [vault\_id](#output\_vault\_id) | ID of the Data Protection backup vault. |
| <a name="output_vault_name"></a> [vault\_name](#output\_vault\_name) | Name of the Data Protection backup vault. |
<!-- END_TF_DOCS -->
