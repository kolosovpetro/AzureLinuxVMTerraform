#################################################################################################################
# RESOURCE GROUP
#################################################################################################################

resource "azurerm_resource_group" "public" {
  location = var.location
  name     = "rg-linux-vms-${var.prefix}"
}

#################################################################################################################
# VNET AND SUBNET
#################################################################################################################

resource "azurerm_virtual_network" "public" {
  name                = "vnet-${var.prefix}"
  address_space       = ["10.10.0.0/24"]
  location            = azurerm_resource_group.public.location
  resource_group_name = azurerm_resource_group.public.name
}

resource "azurerm_subnet" "internal" {
  name                 = "subnet-${var.prefix}"
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes     = ["10.10.0.0/26"]
}

#################################################################################################################
# VIRTUAL MACHINE (PUBLIC KEY AUTH)
#################################################################################################################

module "ubuntu-vm-key-auth" {
  source                      = "./modules/ubuntu-vm-key-auth"
  resource_group_name         = azurerm_resource_group.public.name
  resource_group_location     = azurerm_resource_group.public.location
  subnet_id                   = azurerm_subnet.internal.id
  ip_configuration_name       = "ipc-key-auth-vm-${var.prefix}"
  network_interface_name      = "nic-key-auth-vm-${var.prefix}"
  os_profile_computer_name    = "vm-key-auth-${var.prefix}"
  storage_os_disk_name        = "osdisk-key-auth-vm-${var.prefix}"
  vm_name                     = "vm-key-auth-${var.prefix}"
  public_ip_name              = "pip-key-auth-vm-${var.prefix}"
  os_profile_admin_public_key = file("${path.root}/id_rsa.pub")
  os_profile_admin_username   = "razumovsky_r"
}

resource "azurerm_network_interface_security_group_association" "vm_key_auth_nic_association" {
  network_interface_id      = module.ubuntu-vm-key-auth.network_interface_id
  network_security_group_id = azurerm_network_security_group.public.id
}

#################################################################################################################
# VIRTUAL MACHINE (PASSWORD AUTH)
#################################################################################################################

module "ubuntu-vm-pass-auth" {
  source                    = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name     = "pip-pass-auth-${var.prefix}"
  network_interface_name    = "nic-pass-auth-${var.prefix}"
  os_profile_admin_password = file("${path.root}/password.txt")
  os_profile_admin_username = "razumovsky_r"
  os_profile_computer_name  = "vm-pass-auth-${var.prefix}"
  public_ip_name            = "pip-pass-auth-${var.prefix}"
  resource_group_name       = azurerm_resource_group.public.name
  resource_group_location   = azurerm_resource_group.public.location
  storage_os_disk_name      = "osdisk-pass-auth-vm-${var.prefix}"
  subnet_id                 = azurerm_subnet.internal.id
  vm_name                   = "vm-pass-auth-${var.prefix}"
}

resource "azurerm_network_interface_security_group_association" "vm_pass_auth_nic_association" {
  network_interface_id      = module.ubuntu-vm-pass-auth.network_interface_id
  network_security_group_id = azurerm_network_security_group.public.id
}
