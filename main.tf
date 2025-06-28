#Create Resource Group
resource "azurerm_resource_group" "AVD_rg" {
  name     = "var.resource_group_name"
  location = "var.location"
}

#Create Vnet
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.AVD_rg.name
  resource_group_name = azurerm_resource_group.AVD_rg.name
  address_space       = var.vnet_address_space

}

#Create Subnets
resource "azurerm_subnet" "subnet" {
  for_each = var.Subnets

  name                 = each.key
  resource_group_name  = azurerm_resource_group.AVD_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value

}

#Create host pools, applciation group and workspaces
resource "azurerm_virtual_desktop_host_pool" "host_pools" {
  for_each = var.host_pools

  name                = each.value["name"]
  resource_group_name = azurerm_resource_group.AVD_rg
  location            = azurerm_resource_group.AVD_rg.location
  type                = each.value["friendly_name"]
  #validation_enviroment = each.value["validation_environment"]
  #maximum_sessions      = each.value["maximum_sessions"]
  load_balancer_type = "BreadthFirst"

}

resource "azurerm_virtual_desktop_application_group" "app_group" {
  for_each = var.host_pools

  name = "${each.value["name"]}-app-group"
  #resource_group_name = azurerm_virtual_desktop_application_group.AVD_rg.name
  resource_group_name = var.resource_group_name
  location            = azurerm_virtual_desktop_group.AVD_rg.location
  host_pool_id        = azurerm_virtual_desktop_host_pools.host_pools[each.key].id
  type                = "Desktop"

}

resource "azurerm_virtual_desktop_workspace" "workspaces" {
  for_each = var.host_pools

  name = "${each.value["name"]}-workspace"
  #resource_group_name = azurerm_virtual_desktop_application_group.AVD_rg.name
  resource_group_name = var.resource_group_name
  #location            = azurerm_virtual_desktop_application_group.AVD_rg.location
  location      = var.location
  description   = each.value["workspace_description"]
  friendly_name = each.value["workspace_friendly_name"]

}

resource "azurerm_virtual_desktop_workspace_application_group_association" "workspace_app_group_assoc" {
  for_each = var.host_pools

  application_group_id = azurerm_virtual_desktop_application_group.app_group[each.key].id
  workspace_id         = azurerm_virtual_desktop_workspace.workspaces[each.key].id

}