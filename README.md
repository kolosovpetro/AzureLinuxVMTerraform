# Azure Linux VM Terraform

- Azure Terraform backend: https://github.com/kolosovpetro/AzureTerraformBackend

## SSH commands

- `ssh -o StrictHostKeyChecking=no razumovsky_r@ip`
- `chmod 400 <keyname>.pem`

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