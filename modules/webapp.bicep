param location string = 'westus3'
param namePrefix string = 'pscan'
param appPlanId string

resource webApplication 'Microsoft.Web/sites@2022-03-01' = {
  name: '${namePrefix}-site'
  location: location
  properties: { 
    serverFarmId: appPlanId
    httpsOnly: true
  }
}

output siteurl string = webApplication.properties.defaultHostName
