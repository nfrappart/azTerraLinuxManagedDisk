/*
variable "VmName" {
  type = string
}
*/

#serial of the server like 10, 85, 120, 55 for Covage naming convention
variable "VmNumber" {
  type = string
}

#Azure VM Id
variable "VmId" {
  type = string
}

#Lun Id for attaching disk to VM
variable "LunId" {
  type = string
}

#The target environement for the application
variable "VmEnv" {
  type = string
}
variable "DiskSuffix" {
  type = string
}
variable "RgLocation" {
  type = string
  default = "westeurope"
}
variable "RgName" {
  type = string
}
variable "StorageAccountType" {
  type = string
  default = "Premium_LRS"
}
variable "CreateOption" {
  type = string
  default = "Empty"
}
variable "DiskSize" {
  type = string
  default = "32"
}
variable "AvZones" {
  type = list
  default = ["1"]
}

variable "EnvironmentTag" {
  type = string
  default = "Sbx"
}
variable "UsageTag" {
  type = string
  default = "PoC usage only"
}
variable "OwnerTag" {
  type = string
  default = "Nate"
}
variable "ProvisioningModeTag" {
  type = string
  default = "Terraform"
}
