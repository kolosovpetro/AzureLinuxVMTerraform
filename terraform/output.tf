output "vm_public_key_auth_ip_address" {
  value = module.ubuntu-vm-public-key-auth.vm_public_ip_address
}

output "vm_password_auth_ip_address" {
  value = module.ubuntu-vm-password-auth.vm_public_ip_address
}