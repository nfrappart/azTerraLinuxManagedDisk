# Managed Disk for Data disk Module
This module allows you to create a Managed disk to be attached to an existing VM

## Usage Example :

```hcl
module "testDataDisk" {
  source    = "github.com/nfrappart/azTerraLinuxManagedDisk"
  VmEnv     = "prod" #if you have a terraform state file for each environment you could use a variable 
  VmNumber  = "100" #serial of the server according to naming convention
  VmId          = module.testVM.Id 
  #RgLocation   = module.RG-App_Name-Fr.Location #Default is westeurope
  RgName        = module.RG-App_Name-Fr.Name #existing Resource Group Name 
  #StorageAccountType   = "Standard_LRS" #default is Premium_LRS
  DiskSize              = "128" #default is "32"
  DiskSuffix            = "Images" #Suffix to identify disk usage with name
  LunId                 = "1" #/!\ be very careful with lun id, check existing vm attached disks lun id before setting this value
  EnvironmentTag        = var.TAG-Env
  EnvironmentUsageTag   = var.TAG-Use
  OwnerTag              = "Me" #default is "Nate"
  ProvisioningDateTag   = timestamp()
  ProvisioningModeTag   = "Terraform" #default value is "Terraform"
}
```