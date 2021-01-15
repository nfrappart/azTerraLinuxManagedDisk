# Managed Disk for Data disk Module
This module allows you to create a Managed disk to be attached to an existing VM

## Usage Example :

```hcl
module "testDataDisk" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/Covage-dsi-infra/iac-terraform-modules/TerraLinuxManagedDisk"
  VmPrefix          = var.Prefix #use either dev/qal/ppd/prd to get correct naming var.Prefix should be in current folder _global_variables.tf
  CovageServerId    = "100" #serial of the server according to naming convention
  VmId          = module.testVM.Id 
  #RgLocation    = module.RG-App_Name-Fr.Location #Default is France Central
  RgName        = module.RG-App_Name-Fr.Name #existing Resource Group Name (if not)
  #StorageAccountType    = "Standard_LRS" #default is Premium_LRS
  DiskSize              = "128" #default is "32"
  DiskSuffix    = "FBTH_0" #application quadrigram followed by "_disknumber"
  LunId         = "1" #/!\ be very careful with lun id, check existing vm attached disks lun id before setting this value
  EnvironmentTag        = var.TAG-Env
  EnvironmentUsageTag   = var.TAG-Use
  OwnerTag              = "" #default is "Nate"
  ProvisioningDateTag   = timestamp()
  ProvisioningModeTag   = "Terraform" #default value is "Terraform"
}
```