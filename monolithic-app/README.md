infrastructure as code (IaC)

###### Terrafom Helper

terraform --version
terraform fmt
terraform validate
terraform show

######

terraform init -backend-config=./config/tfstate.conf
terraform apply -var-file=./config/environment.tfvars
terraform destroy -var-file=./config/environment.tfvars
