param location string = resourceGroup().location

resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'manueladfdemo'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: 'manueladf'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}

resource sql 'Microsoft.Sql/servers@2022-02-01-preview' = {
  name: 'manueladfdemo'
  location: location

  properties: {
    administratorLogin: uniqueString(resourceGroup().name) // random data, not using it anyway
    administratorLoginPassword: 'P@$$w0rd1234' // needs to adhere to the policies
  }

  // - Issue: have to remove the login/password from deployment for subsequent deploy.
  // resource auth 'azureADOnlyAuthentications@2022-02-01-preview' = {
  //   name: 'Default'
  //   dependsOn: [
  //     admin
  //   ]
  //   properties: {
  //     azureADOnlyAuthentication: true
  //   }
  // }

  resource admin 'administrators@2022-02-01-preview' = {
    name: 'ActiveDirectory'
    properties: {
      administratorType: 'ActiveDirectory'
      login: 'mriezebosch@gmail.com'
      sid: '05d1c7da-8cdc-461a-9d29-ff009b5478e1'
    }
  }

  resource db 'databases@2022-02-01-preview' = {
    name: 'twig'
    location: location
    sku: {
      name: 'Standard'
      tier: 'Standard'
    }
  }

  resource firewallRule 'firewallRules@2020-11-01-preview' = {
    name: 'AllowAllWindowsAzureIps'
    properties: {
      endIpAddress: '0.0.0.0'
      startIpAddress: '0.0.0.0'
    }
  }

  resource portal 'firewallRules@2020-11-01-preview' = {
    name: 'portal'
    properties: {
      endIpAddress: '31.161.108.20'
      startIpAddress: '31.161.108.20'
    }
  }
}
