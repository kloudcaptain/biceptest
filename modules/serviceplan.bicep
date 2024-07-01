param namePrefix string = 'namePrefix'
param location string = resourceGroup().location
param sku string = 'B1'

resource appServiceplan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: '${namePrefix}-website'
  location: location
  sku: {
    name: sku
  }
}

output planId string = appServiceplan.id
