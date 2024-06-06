siddharthlucky@Siddharths-MacBook-Pro Project 2 % terraform apply -auto-approve
random_id.bucket_id: Refreshing state... [id=cSsx6X6ErJc]
aws_kms_key.project2-s3-kms-key: Refreshing state... [id=db7f5c4d-6809-4f12-907c-9b8509231df1]
aws_s3_bucket.project2_s3_bucket: Refreshing state... [id=project2-s3-bucket-712b31e97e84ac97]
aws_kms_alias.s3_kms_alias: Refreshing state... [id=alias/project2-s3-kms-key]
aws_iam_policy.cross_account_policy: Refreshing state... [id=arn:aws:iam::851725400912:policy/CrossAccountS3KMSEncryptionPolicy]
aws_s3_bucket_policy.project2_bucket_policy: Refreshing state... [id=project2-s3-bucket-712b31e97e84ac97]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

aws_kms_key_arn = "arn:aws:kms:us-east-1:851725400912:key/db7f5c4d-6809-4f12-907c-9b8509231df1"
aws_s3_bucket_id = "project2-s3-bucket-712b31e97e84ac97"
siddharthlucky@Siddharths-MacBook-Pro Project 2 % aws s3 cp hello.txt s3://$(terraform output -raw aws_s3_bucket_id)/ --sse aws:kms --sse-kms-key-id $(terraform output -raw aws_kms_key_arn)

upload: ./hello.txt to s3://project2-s3-bucket-712b31e97e84ac97/hello.txt
siddharthlucky@Siddharths-MacBook-Pro Project 2 %

- Can we only have 1 variable file instead of variable files at multiple level
inferences are making it hard to associate

- Ask about the problem on s3 bucket variables on how 1 is duplicating while the other variables are not
