# Hello Deployment Stacks

Exploring Azure Deployment stack preview

Microsoft official docs : https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deployment-stacks?tabs=azure-cli

Overview

![](imgs/StackOverview.jpg)

## Deployment

```
az login --tenant 7517bc42-bcf8-4916-a677
az account set --subscription c1537527-c126-428d-8f72

az deployment sub create --name "20230722.01" --template-file orchestration.bicep --location westeurope

```


## Deployment Stack

```

az stack sub create --name "hallostack" --template-file orchestration.bicep --location westeurope --deny-settings-mode "DenyDelete"

```

The "Deployment Stack" define the deployment name with the following naming convention: take({stack-name}-{timestamp}-{uniqueid}, 64)

![](imgs/DeploymentsVsStack.jpg)

