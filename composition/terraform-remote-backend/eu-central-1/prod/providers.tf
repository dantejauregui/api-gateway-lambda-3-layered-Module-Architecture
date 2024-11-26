########################################
# Provider to connect to AWS
#
# https://www.terraform.io/docs/providers/aws/
########################################

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47.0"
    }
  }

  # backend "s3" {
  #   bucket = "infra-project-tfstate"
  #   key    = "dev/lambda_project/us-east-1/tfstate"
  #   region = "ap-south-1"
  #   dynamodb_table = "infra-project-statelock"
  # } # use local backend to first create S3 bucket to store .tfstate later
}