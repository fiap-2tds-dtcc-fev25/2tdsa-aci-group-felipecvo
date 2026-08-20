az provider register --namespace Microsoft.KeyVault

az keyvault create \
  --resource-group rg-money-hub \
  --name kv-moneyhub-pf2128 \
  --location eastus \
  --sku standard \
  --enable-rbac-authorization true \
  --output table

az role assignment create \
  --assignee $(az account show --query user.name -o tsv) \
  --role "Key Vault Administrator" \
  --scope /subscriptions/$(az account show --query id -o tsv)/resourceGroups/rg-money-hub/providers/Microsoft.KeyVault/vaults/kv-moneyhub-pf2128

# az keyvault secret set \
#   --vault-name kv-moneyhub-pf2128 \
#   --name mysql-root-password \
#   --value "$MYSQL_ROOT_PASSWORD"
