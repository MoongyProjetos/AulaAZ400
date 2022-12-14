
param storageName string = 'stg${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
      name: 'Premium_LRS'
  }
}


resource appServicePlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: 'jonatasappServicePlanName'
  location: location
  sku: {
    name: 'B3'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'jonatasappServicePlanName'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
