@description('Mandatory. project name')
@minLength(3)
@maxLength(22)
param projectName string

@description('Optional. target location')
@allowed([
  'westeurope'
  'northeurope'
])
param location string = 'westeurope'

@description('Optional. SKU')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
  'Standard_RAGZRS'
])
param stSKU string = 'Standard_LRS'

@description('Optional. Resource tags')
param resourceTags object = {
  env: 'DEV'
}

var storageAccountName = toLower('sto${projectName}')

resource st 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: stSKU
  }
  kind: 'StorageV2'
   properties: {
     accessTier: 'Cool'
   }
  tags: resourceTags
}

output storageAccountId string = st.id
output storageAccountName string = st.name
