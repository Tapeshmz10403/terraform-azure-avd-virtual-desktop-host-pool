# Resource Group
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure regin for resources"
  type        = string
  default     = "easteurope"
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

# Subnets
variable "Subnets" {
  description = "Map of subnets with address prefixes"
  type        = map(list(string))
  default = {
    "Subnet1" = ["10.0.1.0/24"]
  }

}

#host pools
variable "host_pools" {
  description = "Configuration for multiple host pools"
  type = map(object({
    name                    = string
    type                    = string
    friendly_name           = string
    validation_environment  = bool
    maximum_sessions        = number
    workspace_description   = string
    workspace_friendly_name = string
  }))

}

#Subscription id
variable "subscription_id" {
  description = "Azure susscription id"
  type        = string
}

#Workspace name
variable "workspace_name" {
  description = "Azure workspace"
  type        = string
}

#Role definition 
variable "role_definition_id" {
  description = <<EOT
  - desktop virtualization reader: "13d633b2-81c7-4a44-87c0-460493f12e55"
  - Desktop Virtualization Contributor: "d29a9fd4-f9f5-42f0-947c-7d1eabbf76c8"
  EOT
  type        = string
}

#Principle id 
variable "principal_id" {
  description = "Object id or principle id for user, group etc.."
  type        = string
}
