@description('Storage Account type')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param storageAccountType string

@description('Location for the storage account.')
param location string = resourceGroup().location

@description('Kind of Storage account.')
param storageKind string

@description('Prefix for the Storage account name.')
param storagePrefix string

@description('The name of the Storage Account')
param storageAccountName string = '${storagePrefix}${uniqueString(resourceGroup().id)}'

param accessTier string

resource sa 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountType
  }
  kind: storageKind
  properties: {
    accessTier: accessTier
  }
}

output storageAccountName string = storageAccountName
output storageAccountId string = sa.id
