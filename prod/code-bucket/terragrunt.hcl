terraform {
  source = "../../modules/code-bucket"
}

include {
  path = find_in_parent_folders("environment.hcl")
}

locals {
  # -- Project Level -- (Auto)
  project_vars     = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  domain           = local.project_vars.locals.domain
  # -- Environment Level -- (Auto)
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  aws_account_id   = local.environment_vars.locals.aws_account_id
  environment      = local.environment_vars.locals.environment
  # --Service Level -- (Manual)
  service          = "code-bucket"
}

inputs = {
  aws_account_id = "${local.aws_account_id}"
  project_name   = "${local.domain}"
  environment    = "${local.environment}"
  domain         = "${local.domain}"
  service        = "${local.service}"
}