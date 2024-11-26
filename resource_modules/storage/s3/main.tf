########################################
# AWS S3 Bucket resource module
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning
# https://github.com/terraform-aws-modules/terraform-aws-s3-bucket
########################################

resource "aws_s3_bucket" "example" {
  bucket = var.bucket
}

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.example.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}  