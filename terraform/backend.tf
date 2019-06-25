terraform {
  backend "s3"{
    bucket = "master-backend-state"
    key = "core-aws-infra-backbone/state.tf"
    region = "eu-west-1"
  }
}