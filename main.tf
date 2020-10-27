provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "myresourcegroup" {
  name = var.resourcegroup 
  location = var.location
}

resource "azurerm_virtual_desktop_workspace" "myworkspace" {
    name                     = var.workspace
    resource_group_name      = var.resourcegroup 
    location                 = var.location
    depends_on               = [azurerm_resource_group.myresourcegroup]
}

resource "azurerm_virtual_desktop_host_pool" "myhostpool" {
    resource_group_name      = var.resourcegroup 
    name                     = var.hostpool 
    location                 = var.location
    
    validate_environment     = false
    type                     = "Pooled"
    maximum_sessions_allowed = 16
    load_balancer_type       = "BreadthFirst"
    depends_on               = [azurerm_resource_group.myresourcegroup]
}

resource "azurerm_virtual_desktop_application_group" "myappgroup" {
    resource_group_name      = var.resourcegroup 
    host_pool_id             = azurerm_virtual_desktop_host_pool.myhostpool.id
    location                 = var.location
    type                     = "Desktop"
    name                     = var.appgroup
    depends_on               = [azurerm_virtual_desktop_host_pool.myhostpool]
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "myappgroupassociation" {
    application_group_id     = azurerm_virtual_desktop_application_group.myappgroup.id
    workspace_id             = azurerm_virtual_desktop_workspace.myworkspace.id
}