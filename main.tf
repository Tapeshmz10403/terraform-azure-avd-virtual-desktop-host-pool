provider "azurerm" {
  features {}
}

resource "azurerm_virtual_desktop_host_pool" "test" {
  name                = var.host_pool_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type                     = var.host_pool_type
  load_balancer_type       = var.load_balancer_type
  friendly_name            = var.friendly_name
  description              = var.description
  maximum_sessions_allowed = var.maximum_sessions_allowed
  validate_environment     = true
  start_vm_on_connect      = var.start_vm_on_connect
}

resource "azurerm_virtual_desktop_application_group" "test" {
  name                = "${var.host_pool_name}-dag"
  location            = var.location
  resource_group_name = var.resource_group_name

  type          = "Desktop"
  host_pool_id  = azurerm_virtual_desktop_host_pool.test.id
  friendly_name = "${var.host_pool_name}-DAG"
  description   = "Desktop Application Group for ${var.host_pool_name}"
}

resource "azurerm_virtual_desktop_workspace" "test" {
  name                = "${var.host_pool_name}-ws"
  location            = var.location
  resource_group_name = var.resource_group_name
  friendly_name       = "${var.host_pool_name} Workspace"
  description         = "Workspace for ${var.host_pool_name}"
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "test" {
  workspace_id         = azurerm_virtual_desktop_workspace.test.id
  application_group_id = azurerm_virtual_desktop_application_group.test.id
}
