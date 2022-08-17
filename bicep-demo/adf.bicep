param location string = resourceGroup().location

resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'manueladfdemo'
  location: location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'StorageV2'
}
