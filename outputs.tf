output "host_pool_id" {
  description = "ID's of the created virtual_desktop host pools"
  value       = { for k, v in azurerm_virtual_desktop_host_pool.host_pools : k => v.id }
}

output "workspace_name" {
  description = "ID's of the created virtual_desktop workspaces"
  value       = { for k, v in azurerm_virtual_desktop_workspace.workspaces : k => v.id }
}

output "role_assignment_id" {
  description = "The id of the AVD role assignment"
  value       = azurerm_role_assignment.AVD_role_assignment
}