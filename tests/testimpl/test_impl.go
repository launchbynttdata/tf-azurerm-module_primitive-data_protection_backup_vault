package testimpl

import (
	"context"
	"os"
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/dataprotection/armdataprotection"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestBackupVault(t *testing.T, ctx types.TestContext) {

	subscriptionId := os.Getenv("ARM_SUBSCRIPTION_ID")

	if subscriptionId == "" {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)

	if err != nil {
		t.Fatalf("Unable to get Azure credentials: %v", err)
	}

	t.Run("validateBackupVaultExists", func(t *testing.T) {

		resourceGroupName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"resource_group_name",
		)

		vaultName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"backup_vault_name",
		)

		client, err := armdataprotection.NewBackupVaultsClient(
			subscriptionId,
			cred,
			nil,
		)

		if err != nil {
			t.Fatalf("Failed to create BackupVaults client: %v", err)
		}

		vault, err := client.Get(
			context.Background(),
			resourceGroupName,
			vaultName,
			nil,
		)

		assert.NoError(t, err)

		assert.Equal(
			t,
			vaultName,
			*vault.Name,
			"Backup vault name mismatch",
		)
	})
}
