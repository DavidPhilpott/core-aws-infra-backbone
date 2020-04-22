variable aws_account_id {
  type = string
}

variable domain {
  type = string
}

variable service {
  type = string
}

variable environment {
  type = string
}

locals {
  common_tags = {
      "Domain"      = var.domain
      "Environment" = var.environment
      "Service"     = var.service
    }
}