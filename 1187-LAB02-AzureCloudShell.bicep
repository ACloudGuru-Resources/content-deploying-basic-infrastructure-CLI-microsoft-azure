/* "variables": {
  "storageAccountName": "[toLower( concat( 'azurelalab', uniqueString(resourceGroup().id) ))]",
  "networkSecurityGroupName": "shared-nsg",
  "vNet1": {
      "name": "vnet1",
      "addressSpacePrefix": "10.1.0.0/16",
      "subnetName": "subnet1",
      "subnetPrefix": "10.1.1.0/24"
  },
  "imagePublisher": "MicrosoftWindowsServer",
  "imageOffer": "WindowsServer",
  "osVersion": "2022-datacenter-azure-edition",
  "vm1": {
      "name": "dc-vm",
      "vmSize": "Standard_B2s",
      "nicName": "dc-vm-nic1",
      "pubIpName": "dc-vm-pip1",
      "pubIpType": "Dynamic",
      "pubIpSku": "Basic"
  },
  "vm2": {
      "name": "adm-vm",
      "vmSize": "Standard_B2s",
      "nicName": "adm-vm-nic1",
      "pubIpName": "adm-vm-pip1",
      "pubIpType": "Dynamic",
      "pubIpSku": "Basic"
  }
  
},
*/
var vmName = 
var uniqueStorageName = '${toLower(storageNamePrefix)}${uniqueString(resourceGroup().id)}'
var vnetName = 

resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'name'
  location: location
  properties: {
    securityRules: [
      {
        name: 'nsgRule'
        properties: {
          description: 'description'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'name'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'name'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

res-resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2019-11-01' = {
  name: 'name'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    dnsSettings: {
      domainNameLabel: 'dnsname'
    }
  }
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'name'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'name'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: 'subnet.id'
          }
        }
      }
    ]
  }
}

resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'name'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_A2_v2'
    }
    osProfile: {
      computerName: 'computerName'
      adminUsername: 'adminUsername'
      adminPassword: 'adminPassword'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2012-R2-Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: 'id'
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri:  'storageUri'
      }
    }
  }
}
