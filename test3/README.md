terraform init
terraform plan -var-file="stage.tfvars"
terraform apply -var-file="stage.tfvars"
