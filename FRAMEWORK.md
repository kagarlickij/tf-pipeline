# Maintenance
Check if environment is fully covered by IaC with scheduled job using [driftctl](https://driftctl.com)

# Terraform Git repos structure
├── main (covers all infra)  
│   ├── module1 (e.g. S3 bucket)  
│   ├── moduleN (e.g. IAM role)  

# Git flow
`feature/*` - new functionality
`bugfix/*` - fixes for existing functionality
`develop` - integrate multiple feature/bugfixes
`release/*` - set of feature/bugfixes to be deployed
`main` - keep history of successful deployments

# Testing stages
1. `feature/*` - unit tests with `terraform validate` on module level
1. `bugfix/*` - unit tests with `terraform validate` on module level
1. `develop` - integration/contracts tests with `terraform validate` on main (infra) level
1. `release/*` -
    1. security/compliance test with [Snyk](https://snyk.io/product/infrastructure-as-code-security/) or [terraform-compliance](https://github.com/terraform-compliance/cli)
    1. functional tests with `terraform apply` against test env (wrapped in [Terratest](https://terratest.gruntwork.io))
    1. end-to-end test with `terraform apply` against test env (wrapped in [Terratest](https://terratest.gruntwork.io))
1. `main` - no testing required

# Multiple environments
All environments should use the same codebase (modules) but with different variables to address differences in:
1. Resource names (incl. DNS)
1. Capacity
1. Access policies

# Applying across multiple environments
`release/*` build should produce immutable artifact (git tag?) that is used by release pipeline to deploy any env  
However the recommendation is to always deploy new version to non-prod (UAT?) before deploying to PROD

## Terraform state
Each environment should have dedicated Terraform state  
Terraform states should be provisioned by dedicated module with local state (can be placed on Jenkins master)

## Terraform way of structuring
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

## Terragrunt way of structuring
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