resource "azurerm_service_plan" "sp20eteck" {
  name                = "eteck-fa-sp"
  resource_group_name = azurerm_resource_group.rg20eteckdev.name
  location            = azurerm_resource_group.rg20eteckdev.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "fa20eteck" {
  name                = "eteck-fa"
  resource_group_name = azurerm_resource_group.rg20eteckdev.name
  location            = azurerm_resource_group.rg20eteckdev.location

  storage_account_name       = azurerm_storage_account.fa20eteck.name
  storage_account_access_key = azurerm_storage_account.fa20eteck.primary_connection_string
  service_plan_id            = azurerm_service_plan.sp20eteck.id


  site_config {
    application_stack {
      docker {
        registry_url      = azurerm_container_registry.acr.login_server
        image_name        = azurerm_container_group.eteck.name
        image_tag         = " latest"
        registry_username = azurerm_container_registry.acr.admin_password
        registry_password = azurerm_container_registry.acr.admin_username
      }
    }
  }
}
