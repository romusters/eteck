resource "azurerm_storage_account" "sa20famail" {
  name                     = "sa20famail"
  resource_group_name      = azurerm_resource_group.rg20maildev.name
  location                 = azurerm_resource_group.rg20maildev.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
