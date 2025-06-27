output "host_pool_id" {
  description = "ID's of the created AVD host pools"
  value       = { for k, v in azurerm_avd_hodt_pool.var.host_pools : k => v.id }
}

output "workspace_name" {
  description = "ID's of the created AVD workspaces"
  value       = { for k, v in azurerm_avd_workspace.workspaces : k => v.id }
}
