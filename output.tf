output "ssh_public_ip" {
  value = module.ubuntu_vm_key_auth.public_ip
}

output "ssh_public_ip_id" {
  value = module.ubuntu_vm_key_auth.public_ip_id
}

# output "pass_public_ip" {
#   value = module.ubuntu-vm-password-auth.public_ip
# }
#
# output "pass_public_ip_id" {
#   value = module.ubuntu-vm-password-auth.public_ip_id
# }
