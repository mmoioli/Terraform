# azure region
variable "location" {
  type = string
  description = "Azure region where resources will be created"
  default = "east us"
}

# resource group
variable "resourcegroup" {
  type = string
  description = "The resource group for WVD Workspace/Host Pool/App Group deployment"
  default = "RG-TESTTerrformWVD"
}

# Workspace 
variable "workspace" {
  type = string
  description = "The name of the workspace"
  default = "TerraformWS"
}

# Host Pool 
variable "hostpool" {
  type = string
  description = "The name of the Host Pool"
  default = "TerraformHP"
}

# Host Pool 
variable "appgroup" {
  type = string
  description = "The name of the App Group"
  default = "TerraformAP"
}