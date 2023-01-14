resource "azurerm_key_vault" "mail_keyvault" {
  name                       = "mailkeyvault"
  location                   = azurerm_resource_group.rg20eteckdev.location
  resource_group_name        = azurerm_resource_group.rg20eteckdev.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "gmail_app_secret" {
  name         = "gmail-app-secret"
  value        = "" # Set manually
  key_vault_id = azurerm_key_vault.mail_keyvault.id
}

resource "azurerm_key_vault_secret" "from_addr_secret" {
  name         = "from-addr-secret"
  value        = "" # Set manually
  key_vault_id = azurerm_key_vault.mail_keyvault.id
}
