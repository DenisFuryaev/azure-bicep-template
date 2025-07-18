targetScope = 'subscription'

param location string = 'westeurope'
param resourcePrefix string = 'denis-furiaev-empty'
param appRegistrationServicePrincipalId string = 'ed66713b-23f8-431f-9591-4f8416044ee2'
var appRegistrationSuffix = '-app'
var resourceGroupSuffix = '-rg'
var resourceGroupName = '${resourcePrefix}${resourceGroupSuffix}'
var readerRoleDefinitionId = 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
var contributorRoleDefinitionId = 'b24988ac-6180-42a0-ab88-20f7382dd24c'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

module vmsResourceGroupContributorRoleAssignment './module-resourceGroupRoleAssignment.bicep' = {
  scope: resourceGroup
  name: 'resourceGroupContributorRoleAssignment'
  params: {
    principalId: appRegistrationServicePrincipalId
    roleDefinitionId: contributorRoleDefinitionId
  }
}

module subscriptionCustomRoleAssignment './module-subscriptionRoleAssignment.bicep' = {
  scope: subscription()
  name: 'subscriptionReaderRoleAssignment'
  params: {
    principalId: appRegistrationServicePrincipalId
    roleDefinitionId: readerRoleDefinitionId
  }
}
