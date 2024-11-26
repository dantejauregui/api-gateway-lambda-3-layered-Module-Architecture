########################################
# Variables
########################################

variable "env" {
  description = "The name of the environment."
  type        = string
}

variable "region" {
  type = string
}

variable "role_name" {
  type = string
}

variable "profile_name" {
  type = string
}

variable "application_name" {
  description = "The name of the application."
  type        = string
}

variable "app_name" {
  description = "The name of the application."
  type        = string
}

########################################
## Terraform State S3 Bucket
########################################

# variable "acl" {
#   description = "The canned ACL to apply."
#   type        = string
# }


########################################
## DynamoDB
########################################
variable "read_capacity" {
  description = "The number of read units for this table."
  type        = string
}

variable "write_capacity" {
  description = "The number of write units for this table."
  type        = string
}

variable "billing_mode" {
  description = "returns the billing mode"
  type        = string
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key."
  type        = string
}

variable "attribute_name" {}
variable "attribute_type" {}

variable "sse_enabled" {
  description = "Encryption at rest using an AWS managed Customer Master Key. If enabled is false then server-side encryption is set to AWS owned CMK (shown as DEFAULT in the AWS console). If enabled is true then server-side encryption is set to AWS managed CMK (shown as KMS in the AWS console). ."
  type        = string
}