resource "azurerm_application_insights" "appi_fa_mail" {
  name                = "appi20famaildev"
  location            = azurerm_resource_group.rg20maildev.location
  resource_group_name = azurerm_resource_group.rg20maildev.name
  application_type    = "web"
}
