output "aws_kms_key" {
  value = aws_kms_key.project2-ref-s3-kms-key.description
}

output "aws_kms_key_id" {
  value = aws_kms_key.project2-ref-s3-kms-key.id
}