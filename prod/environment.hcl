locals {
  # -- Environment Specific Variables / Infra --
  environment = "prod"
  aws_account_id = "020968065558"
}

# -- Provider and Backend Generators --
generate "provider" {
   path      = "provider.tf"
   if_exists = "overwrite_terragrunt"
   contents  = <<EOF
 provider "aws" {
   region = "eu-west-1"
 }
 EOF
 }

remote_state {
  backend = "s3"
  config = {
    encrypt = true
    bucket = "master-backend-state"
    key = "core-aws-infra-backbone/${path_relative_to_include()}/prod/state.tf"
    region = "eu-west-1"
  }
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}