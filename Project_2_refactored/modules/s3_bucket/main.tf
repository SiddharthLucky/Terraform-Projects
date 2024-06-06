resource "random_id" "bucket_id" {
  byte_length = 8
}

# Create the S3 bucket
resource "aws_s3_bucket" "project2_s3_bucket" {
  bucket = "${var.s3_bucket_name}-${random_id.bucket_id.hex}"
}