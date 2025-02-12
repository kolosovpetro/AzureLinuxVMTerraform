#################################################################################################################
# RESOURCE GROUP
#################################################################################################################

resource "azurerm_resource_group" "public" {
  location = var.location
  name     = "rg-windows-vms-${var.prefix}"
}

#################################################################################################################
# VNET AND SUBNET
#################################################################################################################

resource "azurerm_virtual_network" "public" {
  name                = "vnet-${var.prefix}"
  address_space = ["10.10.0.0/24"]
  location            = azurerm_resource_group.public.location
  resource_group_name = azurerm_resource_group.public.name
}

resource "azurerm_subnet" "internal" {
  name                 = "subnet-${var.prefix}"
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes = ["10.10.0.0/26"]
}

module "ubuntu-vm-key-auth" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = "key-auth-vm-ipconfig-${var.prefix}"
  network_interface_name            = "key-auth-vm-nic-${var.prefix}"
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "key-auth-vm-${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "key-auth-vm-osdisk-${var.prefix}"
  subnet_name                       = azurerm_subnet.internal.name
  vm_name                           = "key-auth-vm-${var.prefix}"
  vm_size                           = var.vm_size
  vnet_name                         = azurerm_virtual_network.public.name
  public_ip_name                    = "key-auth-vm-ip-${var.prefix}"
  subnet_id                         = azurerm_subnet.internal.id
  nsg_name                          = "key-auth-vm-nsg-${var.prefix}"
}

module "ubuntu-vm-password-auth" {
  source                            = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name             = "pass-auth-vm-ipconfig-${var.prefix}"
  network_interface_name            = "pass-auth-vm-nic-${var.prefix}"
  os_profile_admin_password         = var.os_profile_admin_password
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "pass-auth-vm-${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "pass-auth-vm-osdisk-${var.prefix}"
  subnet_name                       = azurerm_subnet.internal.name
  vm_name                           = "pass-auth-vm-${var.prefix}"
  vm_size                           = var.vm_size
  vnet_name                         = azurerm_virtual_network.public.name
  public_ip_name                    = "pass-auth-vm-ip-${var.prefix}"
  subnet_id                         = azurerm_subnet.internal.id
  nsg_name                          = "pass-auth-vm-nsg-${var.prefix}"
}
