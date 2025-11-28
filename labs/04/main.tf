resource "random_id" "rid" {
  byte_length = 2
}

resource "random_pet" "rid" {
  length = 2
}

resource "aws_kms_key" "main-key" {
  description = "KMS key for encrypting CloudTrail logs in CW and S3"
  key_usage   = "ENCRYPT_DECRYPT"
  # customer_master_key_spec
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true
  tags = {
    Name = local.key-name
  }
  policy = data.aws_iam_policy_document.key-policy.json
}

resource "aws_kms_alias" "main-key-alias" {
  name          = format("alias/%s", local.key-name)
  target_key_id = aws_kms_key.main-key.key_id
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = local.bucket-name
  force_destroy = true
  tags = {
    Name = local.bucket-name
  }

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  acl                     = "private" # "acl" conflicts with "grant" and "owner"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    status     = true
    mfa_delete = false
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.main-key.key_id
        sse_algorithm     = "aws:kms"
      }
    }
  }

  lifecycle_rule = [
    {
      id      = "log"
      enabled = true

      filter = {
        tags = {
          some    = "value"
          another = "value2"
        }
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
          }, {
          days          = 60
          storage_class = "GLACIER"
        }
      ]

      expiration = {
        days = 90
      }

      noncurrent_version_expiration = {
        newer_noncurrent_versions = 5
        days                      = 30
      }
    }
  ]
}
