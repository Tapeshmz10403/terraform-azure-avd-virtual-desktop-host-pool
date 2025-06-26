variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where the resources should be created"
  type        = string
}

variable "host_pool_name" {
  description = "Name of the Virtual Desktop Host Pool"
  type        = string
}

variable "host_pool_type" {
  description = "The type of host pool. Possible values: 'Personal' or 'Pooled'"
  type        = string
  default     = "Pooled"
}

variable "load_balancer_type" {
  description = "Load balancing type. Possible values: 'BreadthFirst', 'DepthFirst', 'Persistent'"
  type        = string
  default     = "DepthFirst"
}

variable "friendly_name" {
  description = "Friendly name for the host pool"
  type        = string
  default     = "AVD Host Pool"
}

variable "description" {
  description = "Description for the host pool"
  type        = string
  default     = "Host pool for Azure Virtual Desktop"
}

variable "maximum_sessions_allowed" {
  description = "Maximum number of concurrent sessions"
  type        = number
  default     = 10
}

variable "start_vm_on_connect" {
  description = "Start VM on connect"
  type        = bool
  default     = false
}
