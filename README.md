# Hello Deployment Stacks

Exploring Azure Deployment stack preview

https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deployment-stacks?tabs=azure-cli

## Deployment

```
az login --tenant 7517bc42-bcf8-4916-a677-b5753051f846
az account set --subscription c1537527-c126-428d-8f72-1ac9f2c63c1f

az deployment sub create --name "20230722.01" --template-file orchestration.bicep --location westeurope

```


## Deployment Stack

```

az stack sub create --name "hallostack" --template-file orchestration.bicep --location westeurope --deny-settings-mode "DenyDelete"

```