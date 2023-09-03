# Azure Linux VM Terraform

- Azure Terraform backend: https://github.com/kolosovpetro/AzureTerraformBackend
- Trello Automate Azure Linux VM preinstalled software: https://trello.com/c/NASWJTpR
- Trello Get started with Ansible: https://trello.com/c/bprTa7Jr
- SSH copy ID: https://www.ssh.com/academy/ssh/copy-id

## Notes

- Print available azure vm images:
    - `az vm image list`
    - https://learn.microsoft.com/en-us/cli/azure/vm/image?view=azure-cli-latest#az-vm-image-list
- Print available azure vm sizes:
    - `az vm list-sizes -l "northeurope"`
    - `az vm list-skus -l "northeurope" --size Standard_B4ms`
    - https://docs.microsoft.com/en-us/cli/azure/vm?view=azure-cli-latest#az-vm-list-sizes

## Jenkins commands

### Docs

- Jenkins Docs: https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
- .NET SDK Install Docs: https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2204
- https://stackoverflow.com/questions/61105368/how-to-use-github-personal-access-token-in-jenkins

### Commands

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
| <a name="input_os_profile_admin_password"></a> [os\_profile\_admin\_password](#input\_os\_profile\_admin\_password) | Specifies the password of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_admin_public_key_path"></a> [os\_profile\_admin\_public\_key\_path](#input\_os\_profile\_admin\_public\_key\_path) | Specifies the public key of the administrator account. | `string` | n/a | yes |
| <a name="input_os_profile_admin_username"></a> [os\_profile\_admin\_username](#input\_os\_profile\_admin\_username) | Specifies the name of the administrator account. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Resources name prefix | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_storage_account_replication"></a> [storage\_account\_replication](#input\_storage\_account\_replication) | Messenger storage account replication strategy | `string` | n/a | yes |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | Messenger storage account tier | `string` | n/a | yes |
| <a name="input_storage_image_reference_offer"></a> [storage\_image\_reference\_offer](#input\_storage\_image\_reference\_offer) | Specifies the offer of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_publisher"></a> [storage\_image\_reference\_publisher](#input\_storage\_image\_reference\_publisher) | The publisher of the image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_sku"></a> [storage\_image\_reference\_sku](#input\_storage\_image\_reference\_sku) | Specifies the SKU of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference_version"></a> [storage\_image\_reference\_version](#input\_storage\_image\_reference\_version) | Specifies the version of the platform image or marketplace image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_os_disk_caching"></a> [storage\_os\_disk\_caching](#input\_storage\_os\_disk\_caching) | Specifies the caching requirements for the OS disk. | `string` | n/a | yes |
| <a name="input_storage_os_disk_create_option"></a> [storage\_os\_disk\_create\_option](#input\_storage\_os\_disk\_create\_option) | Specifies how the virtual machine should be created. | `string` | n/a | yes |
| <a name="input_storage_os_disk_managed_disk_type"></a> [storage\_os\_disk\_managed\_disk\_type](#input\_storage\_os\_disk\_managed\_disk\_type) | Specifies the storage account type for the managed disk. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the virtual machine. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pass_public_ip"></a> [pass\_public\_ip](#output\_pass\_public\_ip) | n/a |
| <a name="output_pass_public_ip_id"></a> [pass\_public\_ip\_id](#output\_pass\_public\_ip\_id) | n/a |
| <a name="output_ssh_public_ip"></a> [ssh\_public\_ip](#output\_ssh\_public\_ip) | n/a |
| <a name="output_ssh_public_ip_id"></a> [ssh\_public\_ip\_id](#output\_ssh\_public\_ip\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
