resource deleteLock 'Microsoft.Authorization/locks@2017-04-01' = {
  name: 'delete-lock'
  scope: resourceGroup()
  properties: {
    level: 'CanNotDelete'
    notes: 'Resource group should not be deleted.'
  }
}
