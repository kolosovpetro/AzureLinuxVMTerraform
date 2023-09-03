# Azure Linux VM Terraform

- Azure Terraform backend: https://github.com/kolosovpetro/AzureTerraformBackend
- Trello Automate Azure Linux VM preinstalled software: https://trello.com/c/NASWJTpR
- Trello Get started with Ansible: https://trello.com/c/bprTa7Jr

## Notes

- Print available azure vm images:
    - `az vm image list`
    - https://learn.microsoft.com/en-us/cli/azure/vm/image?view=azure-cli-latest#az-vm-image-list
- Print available azure vm sizes:
    - `az vm list-sizes -l "northeurope"`
    - `az vm list-skus -l "northeurope" --size Standard_B4ms`
    - https://docs.microsoft.com/en-us/cli/azure/vm?view=azure-cli-latest#az-vm-list-sizes

## Jenkins commands

Jenkins Docs: https://www.jenkins.io/doc/book/installing/linux/#debianubuntu

.NET SDK Install Docs: https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2204

https://stackoverflow.com/questions/61105368/how-to-use-github-personal-access-token-in-jenkins

- `sudo systemctl daemon-reload`
- `sudo systemctl restart jenkins`
- `sudo systemctl stop jenkins`
- `sudo systemctl start jenkins`
- `sudo systemctl status jenkins`
- `sudo chmod -R a+rw /var/lib/jenkins`
- `sudo chmod -R a+rw /var/lib/jenkins/workspace`
- `sudo chmod -R a+rw /tmp/NugerScratch`
- `sudo chmod -R a+rw /tmp`
- `sudo ufw allow 8080`
- `sudo apt update`
- `sudo apt install git`

## Sources

- https://azure.microsoft.com/es-es/blog/chocolatey-with-custom-script-extension-on-azure-vms/
- https://devkimchi.com/2020/08/26/app-provisioning-on-azure-vm-with-chocolatey-for-live-streaming/
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension
- https://stackoverflow.com/questions/48653350/what-goes-in-the-ssh-keys-key-data-argument-in-a-terraform-template
- https://linux.how2shout.com/how-to-install-powershell-on-ubuntu-22-04-lts/
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ./modules/keyvault | n/a |
| <a name="module_key_vault_secrets"></a> [key\_vault\_secrets](#module\_key\_vault\_secrets) | ./modules/keyvault-secrets | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ./modules/storage | n/a |
| <a name="module_ubuntu-vm-password-auth"></a> [ubuntu-vm-password-auth](#module\_ubuntu-vm-password-auth) | ./modules/ubuntu-vm-password-auth | n/a |
| <a name="module_ubuntu-vm-public-key-auth"></a> [ubuntu-vm-public-key-auth](#module\_ubuntu-vm-public-key-auth) | ./modules/ubuntu-vm-public-key-auth | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | Name of the IP configuration | `string` | n/a | yes |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Key Vault name | `string` | n/a | yes |
| <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name) | Name of the network interface | `string` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Name of the network security group | `string` | n/a | yes |
| <a name="input_os_profile_admin_password"></a> [os\_profile\_admin\_password](#input\_os\_profile\_admin\_password) | Specifies the password of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_admin_public_key_path"></a> [os\_profile\_admin\_public\_key\_path](#input\_os\_profile\_admin\_public\_key\_path) | Specifies the public key of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_admin_username"></a> [os\_profile\_admin\_username](#input\_os\_profile\_admin\_username) | Specifies the name of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_computer_name"></a> [os\_profile\_computer\_name](#input\_os\_profile\_computer\_name) | Specifies the host OS name of the virtual machine. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Resources name prefix | `string` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Name of the public IP | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Messenger storage account name | `string` | n/a | yes |
| <a name="input_storage_account_replication"></a> [storage\_account\_replication](#input\_storage\_account\_replication) | Messenger storage account replication strategy | `string` | n/a | yes |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | Messenger storage account tier | `string` | n/a | yes |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | Messenger storage container name | `string` | n/a | yes |
| <a name="input_storage_image_reference_offer"></a> [storage\_image\_reference\_offer](#input\_storage\_image\_reference\_offer) | Specifies the offer of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_publisher"></a> [storage\_image\_reference\_publisher](#input\_storage\_image\_reference\_publisher) | The publisher of the image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_sku"></a> [storage\_image\_reference\_sku](#input\_storage\_image\_reference\_sku) | Specifies the SKU of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_version"></a> [storage\_image\_reference\_version](#input\_storage\_image\_reference\_version) | Specifies the version of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_os_disk_caching"></a> [storage\_os\_disk\_caching](#input\_storage\_os\_disk\_caching) | Specifies the caching requirements for the OS disk. | `string` | n/a | yes |
| <a name="input_storage_os_disk_create_option"></a> [storage\_os\_disk\_create\_option](#input\_storage\_os\_disk\_create\_option) | Specifies how the virtual machine should be created. | `string` | n/a | yes |
| <a name="input_storage_os_disk_managed_disk_type"></a> [storage\_os\_disk\_managed\_disk\_type](#input\_storage\_os\_disk\_managed\_disk\_type) | Specifies the storage account type for the managed disk. | `string` | n/a | yes |
| <a name="input_storage_os_disk_name"></a> [storage\_os\_disk\_name](#input\_storage\_os\_disk\_name) | The name of the OS disk. | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the virtual machine. | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pass_public_ip"></a> [pass\_public\_ip](#output\_pass\_public\_ip) | n/a |
| <a name="output_pass_public_ip_id"></a> [pass\_public\_ip\_id](#output\_pass\_public\_ip\_id) | n/a |
| <a name="output_ssh_public_ip"></a> [ssh\_public\_ip](#output\_ssh\_public\_ip) | n/a |
| <a name="output_ssh_public_ip_id"></a> [ssh\_public\_ip\_id](#output\_ssh\_public\_ip\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
