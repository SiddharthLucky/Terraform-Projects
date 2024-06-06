terraform {
  required_providers {
    configuration_aliases = [aws]
  }
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "project3-s3-bucket-user1" {
  provider = aws.user1
  bucket = "project3-${var.bucket_name}-${random_id.bucket_id.hex}"

  tags = {
    Name = "project3-${var.bucket_name}-${random_id.bucket_id.hex}"
  }
}

resource "aws_s3_bucket" "project3-s3-bucket-user2" {
  provider = aws.user2
  bucket = "project3-${var.bucket_name}-${random_id.bucket_id.hex}"

  tags = {
    Name = "project3-${var.bucket_name}-${random_id.bucket_id.hex}"
  }
}

output "s3_bucket_info-user1" {
  value = aws_s3_bucket.project3-s3-bucket-user1
}

output "s3_bucket_info-user2" {
  value = aws_s3_bucket.project3-s3-bucket-user2
}