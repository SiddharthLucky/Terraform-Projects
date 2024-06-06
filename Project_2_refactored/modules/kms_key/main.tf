resource "aws_kms_key" project2-ref-s3-kms-key {
  description = var.description
  deletion_window_in_days = var.duration

  tags = {
    Name = var.kms_key_name
  }
}