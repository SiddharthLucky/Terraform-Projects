provider "aws" {
  region = "us-east-1"
}

# Create the KMS key
resource "aws_kms_key" project2-s3-kms-key {
  description             = "KMS key for S3 bucket encryption"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "s3_kms_alias" {
  name          = "alias/project2-s3-kms-key"
  target_key_id = aws_kms_key.project2-s3-kms-key.id
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

# Create the S3 bucket
resource "aws_s3_bucket" "project2_s3_bucket" {
  bucket = "project2-s3-bucket-${random_id.bucket_id.hex}"  # Replace with your desired bucket name
}

# Attach bucket policy
resource "aws_s3_bucket_policy" "project2_bucket_policy" {
  bucket = aws_s3_bucket.project2_s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyUnencryptedObjectUploads"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.project2_s3_bucket.arn}/*"
        Condition = {
          StringNotEquals = {
            "s3:x-amz-server-side-encryption" = "aws:kms"
          }
        }
      },
      {
        Sid       = "AllowEncryptedObjectUploadsWithCustomKMS"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.project2_s3_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-server-side-encryption-aws-kms-key-id" = aws_kms_key.project2-s3-kms-key.arn
          }
        }
      }
    ]
  })
}

# Create IAM policy for cross-account access
resource "aws_iam_policy" "cross_account_policy" {
  name        = "CrossAccountS3KMSEncryptionPolicy"
  description = "Policy to allow cross-account access to S3 bucket with KMS encryption"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowUseOfKMSKey"
        Effect   = "Allow"
        Action   = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource = aws_kms_key.project2-s3-kms-key.arn
#         Principal = {
#           AWS = "arn:aws:iam::851725400912:root"
#         }
      }
    ]
  })
}

output "aws_s3_bucket_id" {
  value = aws_s3_bucket.project2_s3_bucket.id
}

output "aws_kms_key_arn" {
  value = aws_kms_key.project2-s3-kms-key.arn
}