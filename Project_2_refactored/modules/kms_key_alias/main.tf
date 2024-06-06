resource "aws_kms_alias" "s3_kms_alias" {
  name          = var.kms_key_alias
  target_key_id = var.kms_alias_target_key_id
}