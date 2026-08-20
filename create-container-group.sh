export ACR_NAME=moneyhubpf2128
export ACR_SERVER=${ACR_NAME}.azurecr.io
export MYSQL_ROOT_PASSWORD=$(az keyvault secret show --vault-name kv-moneyhub-pf2128 --name mysql-root-password --query value --output tsv)
export MYSQL_DATABASE=db-dimdim
export MYSQL_USER=$(az keyvault secret show --vault-name kv-moneyhub-pf2128 --name mysql-user --query value --output tsv)
export MYSQL_PASSWORD=$(az keyvault secret show --vault-name kv-moneyhub-pf2128 --name mysql-password --query value --output tsv)
export SPRING_DATASOURCE_URL=$(az keyvault secret show --vault-name kv-moneyhub-pf2128 --name spring-datasource-url --query value --output tsv)
export SPRING_DATASOURCE_USER=$MYSQL_USER
export SPRING_DATASOURCE_PASSWORD=$MYSQL_PASSWORD
export CONNECTIONSTRINGS=$(az keyvault secret show --vault-name kv-moneyhub-pf2128 --name connection-strings --query value --output tsv)

export ACR_USERNAME=$(az acr credential show --name ${ACR_NAME} \
                                        --resource-group rg-money-hub \
                                        --query username --output tsv)

export ACR_PASSWORD=$(az acr credential show --name ${ACR_NAME} \
                                        --resource-group rg-money-hub \
                                 --query passwords[0].value --output tsv)

az container create \
  --resource-group rg-money-hub \
  --file aci-deploy.yaml \
  --output table