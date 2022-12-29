terraform {
  source = "git::https://github.com/inflearn/terraform-aws-ecr.git//.?ref=v1.0.0"
}

locals {
  expire_count = {
    "dev" = 10
    "stg" = 10
    "prod" = 20
  }

  env_hcl = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.env_hcl.locals.env

  domain_hcl = read_terragrunt_config(find_in_parent_folders("domain.hcl"))
  domain = local.domain_hcl.locals.domain
  
  service_hcl = read_terragrunt_config(find_in_parent_folders("service.hcl"))
  service = local.service_hcl.locals.service
}

inputs = {
  name = "${local.env}-${local.domain}-${local.service}"
  expire_count = local.expire_count[local.env]
}