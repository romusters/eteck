resource "azurerm_container_registry" "acr" {
  name                = "eteckContainerRegistry"
  resource_group_name = azurerm_resource_group.rg20eteckdev.name
  location            = azurerm_resource_group.rg20eteckdev.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_container_group" "eteck" {
  name                = "eteck"
  location            = azurerm_resource_group.rg20eteckdev.location
  resource_group_name = azurerm_resource_group.rg20eteckdev.name
  ip_address_type     = "None"
  os_type             = "Linux"

  container {
    name   = "eteck"
    image  = "${azurerm_container_registry.acr.login_server}/eteck:latest"
    cpu    = "0.5"
    memory = "1.5"

    secure_environment_variables = {
      PASSWORD = azurerm_key_vault_secret.gmail_app_secret.value
    }

    environment_variables = {
      CONTENT    = var.content
      START_DATE = var.start_date
    }

  }

  tags = {
    environment = "testing"
  }
}
