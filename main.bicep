param location string = 'westus3'
param storageName string = 'Pscan'
param namePrefix string = 'pscan2'

targetScope = 'resourceGroup'

module storage 'modules/storage.bicep' = {
   name: 'storageDeployment'
   params: {
       location: location
       storageName: storageName
   }
}

module appPlanDeploy 'modules/serviceplan.bicep' = {
  name: 'appPlanDeploy'
  params: {
    location: location
    namePrefix: namePrefix
  }
}

module deployWebsite 'modules/webapp.bicep' = {
  name: '${namePrefix}-deploy-website'
  params: {
    appPlanId: appPlanDeploy.outputs.planId // Reference the output from appPlanDeploy module correctly
    location: location
    namePrefix: namePrefix
  }
}

output siteUrl string = deployWebsite.outputs.siteurl // Reference the output from deployWebsite module correctly
