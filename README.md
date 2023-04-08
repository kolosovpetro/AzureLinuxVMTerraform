# Linux VM in Azure via Terraform

## SSH commands

- `ssh -o StrictHostKeyChecking=no razumovsky_r@ip`
- `chmod 400 <keyname>.pem`

## Jenkins commands

Docs: https://www.jenkins.io/doc/book/installing/linux/#debianubuntu

- `sudo systemctl daemon-reload`
- `sudo systemctl restart jenkins`
- `sudo systemctl status jenkins`
- `sudo ufw allow 8080`

## Terraform commands

- Init examples:
    - `terraform init`
    - `terraform init -backend-config="azure.conf"`
    - `terraform init -backend-config="azure.sas.conf"`
- Plan examples
    - `terraform plan -var "prefix=${prefix}" -out "main.tfplan"`
    - `terraform plan -var "prefix=${prefix}" -var "sql_admin_password=$env:MANGO_TF_SQL_PASS" -out "main.tfplan"`
    - `terraform plan -var "prefix=${prefix}" -var "os_profile_admin_password=1wSWB2Mbl8918kFvtwac" -out "main.tfplan"`
    - `terraform plan -out main.tfplan`
    - `terraform plan -var-file='terraform.dev.tfvars' -var sql_admin_username='razumovsky_r' -var sql_admin_password='Zd2yqLgyV4uHVC0eTPiH' -out 'main.tfplan'`
    - `terraform plan -var-file='terraform.dev.tfvars' -out 'dev.tfplan'`
- Apply examples:
    - `terraform apply main.tfplan`
    - `terraform fmt --check`
- Destroy examples:
    - `terraform plan -var "sql_admin_password=$env:MANGO_TF_SQL_PASS" -var "prefix=${prefix}" -destroy -out "main.destroy.tfplan"`
    - `terraform apply -destroy -auto-approve "main.destroy.tfplan"`
- Workspace examples:
    - `terraform workspace new d01`
    - `terraform workspace select d01`

## Notes

- Print available azure vm images:
    - `az vm image list`
    - https://learn.microsoft.com/en-us/cli/azure/vm/image?view=azure-cli-latest#az-vm-image-list
- Print available azure vm sizes:
    - `az vm list-sizes -l "northeurope"`
    - `az vm list-skus -l "northeurope" --size Standard_B4ms`
    - https://docs.microsoft.com/en-us/cli/azure/vm?view=azure-cli-latest#az-vm-list-sizes
- Custom script extension
  docs: https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows

## Sources

- https://azure.microsoft.com/es-es/blog/chocolatey-with-custom-script-extension-on-azure-vms/
- https://devkimchi.com/2020/08/26/app-provisioning-on-azure-vm-with-chocolatey-for-live-streaming/
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension
- https://stackoverflow.com/questions/48653350/what-goes-in-the-ssh-keys-key-data-argument-in-a-terraform-template