variable "kms_key_alias" {
  description = "Default name for the KMS_KEY_ALIAS"
  default = "default-alias/project2-s3-kms-key"
}

variable "kms_alias_target_key_id" {
  description = "Default id ok KMS key_id"
  nullable = false
  default = ""
}