extension microsoftGraphV1

targetScope = 'subscription'

param appName string = 'denis-furiaev-bicep-app'

resource app 'Microsoft.Graph/applications@v1.0' = {
  uniqueName: appName
  displayName: appName
}
