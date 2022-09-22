#TODO:
1. [DONE] Add S3 module
1. [DONE] Add dedicated backends
1. [DONE] Add Terragrunt
1. Add pipeline to plan on PR
1. Add pipeline to apply on master
1. Add test plan
1. Check testing frameworks

# Local env setup
export AWS_ACCESS_KEY_ID="AKIARZVSUXBIYAMP2MKY"
export AWS_SECRET_ACCESS_KEY="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"
export AWS_REGION="us-east-1"

# Terraform way
cd terraform
tf init -reconfigure -backend-config ./envs/dev/dev.application.hcl
tf plan -var-file="./envs/dev/dev.tfvars"
tf apply -var-file="./envs/dev/dev.tfvars" -auto-approve
tf destroy -var-file="./envs/dev/dev.tfvars" -auto-approve

# Terragrunt way
cd terragrunt/envs/prod
tg init -reconfigure -backend-config ./envs/prod/prod.application.hcl
tg plan
tg apply -auto-approve
tg destroy -auto-approve
