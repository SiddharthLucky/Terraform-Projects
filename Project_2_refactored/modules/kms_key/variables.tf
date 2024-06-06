variable "description" {
  description = "Default KMS description for S3 bucket"
  default = " Default KMS key for S3 Buckets"
}

variable "duration" {
  description = "Default Duration to key destruction"
  default = 10
}

variable "kms_key_name" {
  description = "Default Name of the KMS Key"
  default = "project2_ref_kms_key"
}