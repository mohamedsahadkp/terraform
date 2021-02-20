infrastructure as code (IaC)

###### Terrafom Helper

terraform --version
terraform fmt
terraform validate
terraform show

######

terraform init -backend-config=./config/develop/tfstate.conf
terraform plan -var-file=./config/develop/environment.tfvars
terraform apply -var-file=./config/develop/environment.tfvars
terraform destroy -var-file=./config/develop/environment.tfvars
