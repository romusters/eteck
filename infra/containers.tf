resource "azurerm_container_registry" "acr" {
  name                = "mailContainerRegistry"
  resource_group_name = azurerm_resource_group.rg20maildev.name
  location            = azurerm_resource_group.rg20maildev.location
  sku                 = "Standard"
  admin_enabled       = true
}
