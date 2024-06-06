output "s3_bucket_name" {
  description = "The name of the bucket after making the name unique"
  value = aws_s3_bucket.project2_s3_bucket
}

output "s3_bucket_id" {
  description = "The id of the bucket after making the name unique"
  value = aws_s3_bucket.project2_s3_bucket.id
}