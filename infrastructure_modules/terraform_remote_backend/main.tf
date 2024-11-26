# used to append random integer to S3 bucket to avoid conflicting bucket name across the globe
resource "random_integer" "digits" {
  min = 1
  max = 100

  keepers = {
    # Generate a new integer each time s3_bucket_name value gets updated
    listener_arn = var.app_name
  }
}


########################################
## S3
########################################
module "s3_bucket_terraform_remote_backend" {
  source = "../../resource_modules/storage/s3"

  bucket        = local.bucket_name
  # acl           = var.acl
}

########################################
## Dynamodb for TF state locking
########################################
module "dynamodb_terraform_state_lock" {
  source         = "../../resource_modules/database/dynamodb"
  name           = local.dynamodb_name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  attribute_name = var.attribute_name
  attribute_type = var.attribute_type
  sse_enabled    = var.sse_enabled
  tags           = var.tags

  depends_on = [
    module.s3_bucket_terraform_remote_backend,
    module.s3_kms_key_terraform_backend
  ]
}

########################################
## KMS
########################################
module "s3_kms_key_terraform_backend" {
  source = "../../resource_modules/identity/kms_key"

  name                    = local.ami_kms_key_name
  description             = local.ami_kms_key_description
  deletion_window_in_days = local.ami_kms_key_deletion_window_in_days
  tags                    = local.ami_kms_key_tags
  policy                  = data.aws_iam_policy_document.s3_terraform_states_kms_key_policy.json
  enable_key_rotation     = true
}