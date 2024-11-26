########################################
# Environment setting
########################################
region           = "eu-central-1"
role_name        = "Admin"
profile_name     = "aws-demo" #something related with aws cli???
env              = "prod"
application_name = "terraform-eks-demo-infra"
app_name         = "terraform-eks-demo-infra"

########################################
## Terraform State S3 Bucket
########################################
# acl                = "private"


########################################
## DynamoDB
########################################
read_capacity  = 5
write_capacity = 5
billing_mode   = "PROVISIONED"
hash_key       = "LockID" # state locking
sse_enabled    = true     # enable server side encryption
attribute_name = "LockID"
attribute_type = "S"
