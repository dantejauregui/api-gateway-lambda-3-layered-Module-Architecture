########################################
# AWS Terraform backend composition
########################################

module "terraform_remote_backend" {
  source   = "../../../../infrastructure_modules/terraform_remote_backend"
  env      = var.env
  app_name = var.app_name
  region   = var.region
  tags     = local.tags

  ########################################
  ## Terraform State S3 Bucket
  ########################################
  # acl                = var.acl # infra's input var = composition's input var, coming from .tfvars


  ########################################
  ## DynamoDB
  ########################################
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  attribute_name = var.attribute_name
  attribute_type = var.attribute_type
  sse_enabled    = var.sse_enabled
}
