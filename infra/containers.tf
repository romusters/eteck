resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry"
  resource_group_name = azurerm_resource_group.rg20eteckdev.name
  location            = azurerm_resource_group.rg20eteckdev.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_container_group" "eteck" {
  name                = "eteck"
  location            = azurerm_resource_group.rg20eteckdev.location
  resource_group_name = azurerm_resource_group.rg20eteckdev.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "eteck"
    image  = "mcr.microsoft.com/azuredocs/eteck:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  container {
    name   = "eteck"
    image  = "mcr.microsoft.com/azuredocs/eteck"
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
