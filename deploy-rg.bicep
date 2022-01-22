// this file can only be deployed at a subscription scope
targetScope = 'subscription'

@description('Name of the Resource Group to create')
param rgName string = 'rg-dns'

@description('Location for the Resource Group')
param rgLocation string = 'westeurope'

@allowed([
  'Dev'
  'Test'
  'Prod'
])
@description('Environment for the Resource Group')
param environment string = 'Dev'

@description('Tags for the Resource Group')
param resourceTags object = {
  WorkloadName: 'Azure DNS'
  Env: environment
  Criticality: 'Mission-critical'
}

resource dnsRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: toLower(rgName)
  location: rgLocation
  tags: resourceTags
}

module lock 'delete-lock-rg.bicep' = {
  name: 'lock'
  scope: dnsRG  
}

output resourceID string = dnsRG.id
