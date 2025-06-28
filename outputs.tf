output "host_pool_id" {
  description = "ID's of the created virtual_desktop host pools"
  value       = { for k, v in azurerm_virtual_desktop_hodt_pool.var.host_pools : k => v.id }
}

output "workspace_name" {
  description = "ID's of the created virtual_desktop workspaces"
  value       = { for k, v in azurerm_virtual_desktop_workspace.workspaces : k => v.id }
}
