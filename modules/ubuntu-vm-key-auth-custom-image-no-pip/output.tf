output "username" {
  value = var.os_profile_admin_username
}

output "network_interface_id" {
  value = azurerm_network_interface.public.id
}

output "ip_configuration_name" {
  value = var.ip_configuration_name
}
