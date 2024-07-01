param storageName string = 'storageName'
param location string = 'westus'
param kindType string = 'Premium_LRS'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: kindType
  }
  properties: {
    accessTier: 'Hot'
  }
}
