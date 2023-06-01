resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = "${var.resource_group_name}-${var.prefix}"
}

module "ubuntu-vm-public-key-auth" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = var.ip_configuration_name
  network_interface_name            = var.network_interface_name
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "${var.os_profile_computer_name}${var.prefix}"
  prefix                            = var.prefix
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = var.storage_os_disk_name
  subnet_name                       = var.subnet_name
  vm_name                           = "${var.vm_name}${var.prefix}"
  vm_size                           = var.vm_size
  vnet_name                         = var.vnet_name

  depends_on = [
    azurerm_resource_group.public
  ]
}