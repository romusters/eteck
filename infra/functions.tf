resource "azurerm_service_plan" "sp20mail" {
  name                = "mail-fa-sp"
  resource_group_name = azurerm_resource_group.rg20maildev.name
  location            = azurerm_resource_group.rg20maildev.location
  os_type             = "Linux"
  sku_name            = "EP1" # TODO too expensive?
}

resource "azurerm_linux_function_app" "fa20mail" {
  name                = "mail-fa"
  resource_group_name = azurerm_resource_group.rg20maildev.name
  location            = azurerm_resource_group.rg20maildev.location

  storage_account_name       = azurerm_storage_account.sa20famail.name
  storage_account_access_key = azurerm_storage_account.sa20famail.primary_access_key
  service_plan_id            = azurerm_service_plan.sp20mail.id
  https_only                 = true

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATION_KEY     = azurerm_application_insights.appi_fa_mail.instrumentation_key
    CONTENT                             = var.content
    FUNCTIONS_WORKER_RUNTIME            = "python"
    FUNCTION_APP_EDIT_MODE              = "readOnly"
    PASSWORD                            = azurerm_key_vault_secret.gmail_app_secret.value
    START_DATE                          = var.start_date
    DOCKER_REGISTRY_SERVER_USERNAME     = azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_URL          = azurerm_container_registry.acr.login_server
    DOCKER_REGISTRY_SERVER_PASSWORD     = azurerm_container_registry.acr.admin_password
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  }

  site_config {
    # container_registry_use_managed_identity = true


    application_stack {
      docker {
        image_name   = "mail"
        image_tag    = "latest"
        registry_url = azurerm_container_registry.acr.login_server


      }
    }
    always_on     = false
    http2_enabled = true
    ftps_state    = "Disabled"
  }


}
