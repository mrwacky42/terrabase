This directory is separate owing to the fact that the preshared keys will get pushed into the terraform state files.

see https://github.com/hashicorp/terraform/issues/516#issuecomment-192509741
for more details

our interim solution is to not store (.gitignore) the `terraform.tfstate` file in this directory.
the vpn connections are idempotent if recreated, and there is no state loss.

