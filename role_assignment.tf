resource "azurerm_role_assignment" "AVD_role_assignment" {
  scope                = "data.azurerm_virtual_desktop_workspace.target_workspace.id"
  role_definition_name = var.role_definition_id
  principal_id         = var.principal_id

}

#Data source to feth AVD workspace details
data "azurerm_virtual_desktop_workspace" "target_workspace" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
}

