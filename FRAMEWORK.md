# Terraform cloud benefits over Jenkins pipeline
1. Managed service (jenkins is single server)  
1. Not a piece of infra (solves chicken-egg problem)  
1. Supports granular permissions (current Jenkins setup doesn't)  
1. No pipeline development and maintenance required (works out of the box)  
1. Solid integration with GitHub (e.g. plans are auto queued)  
1. Provided ability to use certain Terraform version (without creating multiple AMIs)  
1. Great visualization of all actions (plans, applies, etc.)  

# Terraform Git repos structure
├── main (covers all infra and can host some or all modules)  
│   ├── module1 (e.g. S3 bucket)  
│   ├── moduleN (e.g. IAM role)  

# Git flow
`feature/*` - new functionality, used for PR validation (plan)  
`bugfix/*` - fixes for existing functionality, used for PR validation (plan)  
`master` - integrate multiple feature/bugfixes, used for apply (multiple environments)  

# Multiple environments
All environments should use the same codebase (modules) but with different variables to address differences in:
1. Resource names (incl. DNS)
1. Capacity
1. Access policies

# Terraform way of structuring
├── main.tf (calling modules)  
├── variables.tf (declaring variables)  
├── provider.tf (declaring general AWS settings)  
├── output.tf (declaring output)  
│   ├── envs  
│      ├── dev  
│           ├── dev.tfvars (env-related variables: names, capacity, etc.)  
│           ├── dev.application.hcl (env-related terraform state params: bucket, table, etc.)  
│      ├── stg  
│           ├── stg.tfvars (env-related variables: names, capacity, etc.)  
│           ├── stg.application.hcl (env-related terraform state params: bucket, table, etc.)  
│      ├── uat  
│           ├── uat.tfvars (env-related variables: names, capacity, etc.)  
│           ├── uat.application.hcl (env-related terraform state params: bucket, table, etc.)  
│      ├── prod  
│           ├── prod.tfvars (env-related variables: names, capacity, etc.)  
│           ├── prod.application.hcl (env-related terraform state params: bucket, table, etc.)  

Execution:
```
terraform init -reconfigure -backend-config ./envs/dev/dev.application.hcl
terraform plan -var-file="./envs/dev/dev.tfvars"
```

# Terragrunt way of structuring
├── envs  
│   ├── dev  
│        ├── terragrunt.hcl (all in one: calls modules, declares env-related variables, general AWS settings, output)  
│        ├── dev.application.hcl (env-related terraform state params: bucket, table, etc.)  
│   ├── stg  
│        ├── terragrunt.hcl (all in one: calls modules, declares env-related variables, general AWS settings, output)  
│        ├── stg.application.hcl (env-related terraform state params: bucket, table, etc.)  
│   ├── uat  
│        ├── terragrunt.hcl (all in one: calls modules, declares env-related variables, general AWS settings, output)  
│        ├── uat.application.hcl (env-related terraform state params: bucket, table, etc.)  
│   ├── prod  
│        ├── terragrunt.hcl (all in one: calls modules, declares env-related variables, general AWS settings, output)  
│        ├── prod.application.hcl (env-related terraform state params: bucket, table, etc.)  