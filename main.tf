# REVIEW NEEDED !!!! ###
resource "azurerm_managed_disk" "Terra-DataDisk" {
  name                 = "${var.VmEnv}lin${format("%04d", var.VmNumber)}-DataDisk-${var.DiskSuffix}"
  location             = var.RgLocation
  resource_group_name  = var.RgName
  storage_account_type = var.StorageAccountType
  create_option        = var.CreateOption
  disk_size_gb         = var.DiskSize

  tags = {
    Environment       = var.EnvironmentTag
    Usage             = var.EnvironmentUsageTag
    Owner             = var.OwnerTag
    ProvisioningDate  = var.ProvisioningDateTag
    ProvisioningMode  = var.ProvisioningModeTag
  }
  lifecycle {
    ignore_changes = [
      tags["ProvisioningDate"],
    ]
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "Terra-DataDisk-Attachment" {
  managed_disk_id    = azurerm_managed_disk.Terra-DataDisk.id
  virtual_machine_id = var.VmId
  lun                = var.LunId 
  caching            = "ReadWrite"
}