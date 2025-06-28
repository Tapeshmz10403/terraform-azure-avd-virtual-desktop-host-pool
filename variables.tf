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



#OLD entry -------
# variable "host_pools" {
#   type = list(object({
#     name               = string
#     location           = string
#     resource_group     = string
#     session_host_count = number
#     vm_size            = string
#     vnet_id            = string
#     subnet_id          = string
#     domain_join_type   = string
#     ad_domain          = string
#     fslogix_profile = object({
#       storage_account_name = string
#       share_name           = string
#     })
#   }))
# }

# variable "virtual_desktop_image_reference" {
#   type = object({
#     publisher = string
#     offer     = string
#     sku       = string
#     version   = string
#   })
# }

# variable "log_analytics_workspace_id" {
#   type = string
# }

# variable "admin_username" {
#   type = string
# }

# variable "admin_password" {
#   type      = string
#   sensitive = true
# }