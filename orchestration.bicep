
targetScope = 'subscription'

var projectName = 'hallostack'
var orchestrationName = 'something'

module modResourceGroup  'modules/rg.bicep' = { 
  name: take('${deployment().name}-${orchestrationName}-rg', 64)
  params:{
    name: projectName
  }
  dependsOn: []  
}

module modStorage  'modules/storage.bicep' = { 
  name: take('${deployment().name}-${orchestrationName}-sto', 64)
  scope: resourceGroup(projectName)
  params:{
    projectName: projectName
  }
  dependsOn: [modResourceGroup]  
}
