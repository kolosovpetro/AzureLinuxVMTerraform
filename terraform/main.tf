data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = "${var.resource_group_name}-${var.prefix}"
}

module "network" {
  source                  = "./modules/network"
  nsg_name                = var.nsg_name
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = "${var.vm_name}${var.prefix}"
  vnet_name               = "${var.vnet_name}-${var.prefix}"
}

module "ubuntu-vm-public-key-auth" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = "${var.ip_configuration_name}-${var.prefix}-key-auth"
  network_interface_name            = "${var.network_interface_name}-${var.prefix}-key-auth"
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "${var.os_profile_computer_name}${var.prefix}KeyAuth"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "${var.storage_os_disk_name}-${var.prefix}"
  subnet_name                       = module.network.subnet_name
  vm_name                           = "${var.vm_name}${var.prefix}KeyAuth"
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name
  public_ip_name                    = "${var.public_ip_name}-${var.prefix}-key-auth"
  subnet_id                         = module.network.subnet_id
  nsg_name                          = "${var.nsg_name}-${var.prefix}-key-auth"

  depends_on = [
    azurerm_resource_group.public,
    module.network.subnet_name,
    module.network.vnet_name,
    module.network.subnet_id
  ]
}

module "ubuntu-vm-password-auth" {
  source                            = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name             = "${var.ip_configuration_name}-${var.prefix}-pass-auth"
  network_interface_name            = "${var.network_interface_name}-${var.prefix}-pass-auth"
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_admin_password         = var.os_profile_admin_password
  os_profile_computer_name          = "${var.os_profile_computer_name}${var.prefix}PassAuth"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "${var.storage_os_disk_name}-${var.prefix}-pass-auth"
  subnet_name                       = module.network.subnet_name
  vm_name                           = "${var.vm_name}${var.prefix}PassAuth"
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name
  public_ip_name                    = "${var.public_ip_name}-${var.prefix}-pass-auth"
  subnet_id                         = module.network.subnet_id
  nsg_name                          = "${var.nsg_name}-${var.prefix}-pass-auth"

  depends_on = [
    azurerm_resource_group.public,
    module.network.subnet_name,
    module.network.vnet_name,
    module.network.subnet_id
  ]
}

module "storage" {
  source                      = "./modules/storage"
  storage_account_name        = "${var.storage_account_name}${var.prefix}"
  storage_account_replication = var.storage_account_replication
  storage_account_tier        = var.storage_account_tier
  storage_container_name      = var.storage_container_name
  storage_location            = azurerm_resource_group.public.location
  storage_resource_group_name = azurerm_resource_group.public.name

  depends_on = [
    azurerm_resource_group.public
  ]
}

module "key_vault" {
  source                 = "./modules/keyvault"
  kv_location            = azurerm_resource_group.public.location
  kv_name                = "${var.kv_name}${var.prefix}"
  kv_resource_group_name = azurerm_resource_group.public.name
  object_id              = data.azurerm_client_config.current.object_id
  tenant_id              = data.azurerm_client_config.current.tenant_id

  depends_on = [
    azurerm_resource_group.public
  ]
}

module "key_vault_secrets" {
  source                    = "./modules/keyvault-secrets"
  keyvault_id               = module.key_vault.id
  storage_access_url        = module.storage.storage_access_url
  storage_account_name      = module.storage.storage_account_name
  storage_connection_string = module.storage.storage_connection_string
  storage_container_name    = module.storage.storage_container_name
  storage_primary_key       = module.storage.storage_primary_key

  depends_on = [
    module.key_vault,
    module.storage
  ]
}