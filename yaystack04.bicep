
targetScope = 'subscription'

var projectName = 'yaystack'
var orchestrationName = 'four'

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
