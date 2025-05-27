extension microsoftGraphV1

param appName string = 'denis-furiaev-bicep-test'

resource app 'Microsoft.Graph/applications@v1.0' = {
  uniqueName: appName
  displayName: appName
}
