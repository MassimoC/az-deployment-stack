targetScope = 'subscription'

@description('Required. The name of the Resource Group.')
param name string

@description('Optional. Location of the Resource Group. It uses the deployment\'s location when not provided.')
param location string = deployment().location

@description('Optional. Tags of the storage account resource.')
param tags object = {}

@description('Optional. The ID of the resource that manages this resource group.')
param managedBy string = ''

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  location: location
  name: name
  tags: tags
  managedBy: managedBy
  properties: {}
}

output rgName string = resourceGroup.name
