
# Create S3 buckets for each account
module "s3_buckets" {
  source      = "./modules/s3 bucket"
  for_each = local.users

  providers = {
    //aws = each.value == "terraform2" ? aws.Terraform-2 : aws.Terraform-3
    aws.user1 = aws.Terraform-2
    aws.user2 = aws.Terraform-3
  }
  //user = each.key
  bucket_name = var.accounts[each.key == "terraform2" ? 0 : 1].bucket_name
}