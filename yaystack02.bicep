
targetScope = 'subscription'

var projectName = 'yaystack'
var orchestrationName = 'one'

module modResourceGroup  'modules/rg.bicep' = { 
  name: take('${deployment().name}-${orchestrationName}-rg', 64)
  params:{
    name: projectName
  }
  dependsOn: []  
}

module modStorageAlpha  'modules/storage.bicep' = { 
  name: take('${deployment().name}-${orchestrationName}-sto-alpha', 64)
  scope: resourceGroup(projectName)
  params:{
    projectName: '${projectName}alpha'
  }
  dependsOn: [modResourceGroup]  
}

module modStorageBeta  'modules/storage.bicep' = { 
  name: take('${deployment().name}-${orchestrationName}-sto-beta', 64)
  scope: resourceGroup(projectName)
  params:{
    projectName: '${projectName}beta'
    stSKU:'Standard_GRS'
  }
  dependsOn: [modResourceGroup]  
}

module modStorageGamma  'modules/storage.bicep' = { 
  name: take('${deployment().name}-${orchestrationName}-sto-gamma', 64)
  scope: resourceGroup(projectName)
  params:{
    projectName: '${projectName}gamma'
  }
  dependsOn: [modResourceGroup]  
}
