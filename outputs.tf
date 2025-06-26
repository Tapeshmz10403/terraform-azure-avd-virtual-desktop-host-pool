output "host_pool_id" {
  value = azurerm_virtual_desktop_host_pool.main.id
}

output "application_group_id" {
  value = azurerm_virtual_desktop_application_group.main.id
}

output "workspace_id" {
  value = azurerm_virtual_desktop_workspace.main.id
}
