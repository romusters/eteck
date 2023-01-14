resource "azurerm_storage_account" "fa20eteck" {
  name                     = "fa20eteck"
  resource_group_name      = azurerm_resource_group.rg20eteckdev.name
  location                 = azurerm_resource_group.rg20eteckdev.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
