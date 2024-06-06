siddharthlucky@Siddharths-MacBook-Pro Project 1 % terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_instance_profile.Project1-EC2-S3-InstanceProfile will be created
  + resource "aws_iam_instance_profile" "Project1-EC2-S3-InstanceProfile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "Terraform1-ec2_instance_profile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = (known after apply)
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_role.Project1-EC2-Role-S3 will be created
  + resource "aws_iam_role" "Project1-EC2-Role-S3" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "Terraform1-ec2-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy.ec2_additional_permissions will be created
  + resource "aws_iam_role_policy" "ec2_additional_permissions" {
      + id          = (known after apply)
      + name        = "ec2_additional_permissions"
      + name_prefix = (known after apply)
      + policy      = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeVpcs",
                          + "ec2:DescribeInstances",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role        = (known after apply)
    }

  # aws_iam_role_policy_attachment.Project1-EC2-S3-RolePolicy will be created
  + resource "aws_iam_role_policy_attachment" "Project1-EC2-S3-RolePolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
      + role       = (known after apply)
    }

  # aws_instance.Project1-Ec2-Instance will be created
  + resource "aws_instance" "Project1-Ec2-Instance" {
      + ami                                  = "ami-00beae93a2d981137"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = "us-east-1a"
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "Terraform1-ec2_instance_profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "TF-new-Keypair"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "Terraform1-Project1-EC2"
        }
      + tags_all                             = {
          + "Name" = "Terraform1-Project1-EC2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_internet_gateway.Project1-Gateway will be created
  + resource "aws_internet_gateway" "Project1-Gateway" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "Terraform1-Project1-Gateway"
        }
      + tags_all = {
          + "Name" = "Terraform1-Project1-Gateway"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.Project1-RouteTable will be created
  + resource "aws_route_table" "Project1-RouteTable" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = ""
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = "::/0"
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "Terraform1-Project1-RouteTable"
        }
      + tags_all         = {
          + "Name" = "Terraform1-Project1-RouteTable"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.Project1-RouteTable-Association will be created
  + resource "aws_route_table_association" "Project1-RouteTable-Association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_s3_bucket.Project1-S3Bucket will be created
  + resource "aws_s3_bucket" "Project1-S3Bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "terraform1-project1-tf-s3bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Name" = "terraform1-project1-tf-s3bucket"
        }
      + tags_all                    = {
          + "Name" = "terraform1-project1-tf-s3bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # aws_s3_bucket_lifecycle_configuration.Project1-Bucket-Config will be created
  + resource "aws_s3_bucket_lifecycle_configuration" "Project1-Bucket-Config" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + id     = "log"
          + status = "Enabled"

          + transition {
              + days          = 30
              + storage_class = "GLACIER"
            }
        }
    }

  # aws_s3_bucket_policy.Project1-S3-BucketPolicy will be created
  + resource "aws_s3_bucket_policy" "Project1-S3-BucketPolicy" {
      + bucket = (known after apply)
      + id     = (known after apply)
      + policy = (known after apply)
    }

  # aws_security_group.Project1-SecurityGroup will be created
  + resource "aws_security_group" "Project1-SecurityGroup" {
      + arn                    = (known after apply)
      + description            = "Private SG"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "HTTP"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "HTTPS"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "SSH"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "private-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "Project1-SecurityGroup"
        }
      + tags_all               = {
          + "Name" = "Project1-SecurityGroup"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.Project1-Subnet will be created
  + resource "aws_subnet" "Project1-Subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "Terraform1-Project1-Subnet"
        }
      + tags_all                                       = {
          + "Name" = "Terraform1-Project1-Subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.Project1-VPC will be created
  + resource "aws_vpc" "Project1-VPC" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "Terraform1-Project1-VPC"
        }
      + tags_all                             = {
          + "Name" = "Terraform1-Project1-VPC"
        }
    }

  # aws_vpc_endpoint.Project1-VPC-Endpoint will be created
  + resource "aws_vpc_endpoint" "Project1-VPC-Endpoint" {
      + arn                   = (known after apply)
      + cidr_blocks           = (known after apply)
      + dns_entry             = (known after apply)
      + id                    = (known after apply)
      + ip_address_type       = (known after apply)
      + network_interface_ids = (known after apply)
      + owner_id              = (known after apply)
      + policy                = (known after apply)
      + prefix_list_id        = (known after apply)
      + private_dns_enabled   = (known after apply)
      + requester_managed     = (known after apply)
      + route_table_ids       = (known after apply)
      + security_group_ids    = (known after apply)
      + service_name          = "com.amazonaws.us-east-1.s3"
      + state                 = (known after apply)
      + subnet_ids            = (known after apply)
      + tags                  = {
          + "Name" = "Terraform1-Project1-S3-VPC"
        }
      + tags_all              = {
          + "Name" = "Terraform1-Project1-S3-VPC"
        }
      + vpc_endpoint_type     = "Gateway"
      + vpc_id                = (known after apply)
    }

Plan: 15 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + Created_bucketName = "terraform1-project1-tf-s3bucket"
aws_iam_role.Project1-EC2-Role-S3: Creating...
aws_vpc.Project1-VPC: Creating...
aws_s3_bucket.Project1-S3Bucket: Creating...
aws_iam_role.Project1-EC2-Role-S3: Creation complete after 2s [id=Terraform1-ec2-role]
aws_iam_role_policy_attachment.Project1-EC2-S3-RolePolicy: Creating...
aws_iam_role_policy.ec2_additional_permissions: Creating...
aws_iam_instance_profile.Project1-EC2-S3-InstanceProfile: Creating...
aws_iam_role_policy_attachment.Project1-EC2-S3-RolePolicy: Creation complete after 1s [id=Terraform1-ec2-role-20240603165327071100000001]
aws_iam_role_policy.ec2_additional_permissions: Creation complete after 1s [id=Terraform1-ec2-role:ec2_additional_permissions]
aws_iam_instance_profile.Project1-EC2-S3-InstanceProfile: Creation complete after 2s [id=Terraform1-ec2_instance_profile]
aws_vpc.Project1-VPC: Creation complete after 4s [id=vpc-0f014f7baffd63a24]
aws_internet_gateway.Project1-Gateway: Creating...
aws_subnet.Project1-Subnet: Creating...
aws_security_group.Project1-SecurityGroup: Creating...
aws_s3_bucket.Project1-S3Bucket: Creation complete after 6s [id=terraform1-project1-tf-s3bucket]
aws_s3_bucket_policy.Project1-S3-BucketPolicy: Creating...
aws_s3_bucket_lifecycle_configuration.Project1-Bucket-Config: Creating...
aws_subnet.Project1-Subnet: Creation complete after 2s [id=subnet-0885fadace4991353]
aws_internet_gateway.Project1-Gateway: Creation complete after 2s [id=igw-0f1d1daa1ed9da79e]
aws_route_table.Project1-RouteTable: Creating...
aws_s3_bucket_policy.Project1-S3-BucketPolicy: Creation complete after 2s [id=terraform1-project1-tf-s3bucket]
aws_security_group.Project1-SecurityGroup: Creation complete after 5s [id=sg-0b5d8b8761896ba1b]
aws_instance.Project1-Ec2-Instance: Creating...
aws_route_table.Project1-RouteTable: Creation complete after 4s [id=rtb-072a74a2e1ce01804]
aws_route_table_association.Project1-RouteTable-Association: Creating...
aws_vpc_endpoint.Project1-VPC-Endpoint: Creating...
aws_route_table_association.Project1-RouteTable-Association: Creation complete after 2s [id=rtbassoc-0ab1a1d482099f121]
aws_s3_bucket_lifecycle_configuration.Project1-Bucket-Config: Still creating... [10s elapsed]
aws_vpc_endpoint.Project1-VPC-Endpoint: Creation complete after 8s [id=vpce-0dffe784596401472]
aws_instance.Project1-Ec2-Instance: Still creating... [10s elapsed]
aws_s3_bucket_lifecycle_configuration.Project1-Bucket-Config: Still creating... [20s elapsed]
aws_instance.Project1-Ec2-Instance: Still creating... [20s elapsed]
aws_s3_bucket_lifecycle_configuration.Project1-Bucket-Config: Still creating... [30s elapsed]
aws_instance.Project1-Ec2-Instance: Still creating... [30s elapsed]
aws_s3_bucket_lifecycle_configuration.Project1-Bucket-Config: Creation complete after 34s [id=terraform1-project1-tf-s3bucket]
aws_instance.Project1-Ec2-Instance: Provisioning with 'remote-exec'...
aws_instance.Project1-Ec2-Instance (remote-exec): Connecting to remote host via SSH...
aws_instance.Project1-Ec2-Instance (remote-exec):   Host: 54.224.89.7
aws_instance.Project1-Ec2-Instance (remote-exec):   User: ec2-user
aws_instance.Project1-Ec2-Instance (remote-exec):   Password: false
aws_instance.Project1-Ec2-Instance (remote-exec):   Private key: true
aws_instance.Project1-Ec2-Instance (remote-exec):   Certificate: false
aws_instance.Project1-Ec2-Instance (remote-exec):   SSH Agent: true
aws_instance.Project1-Ec2-Instance (remote-exec):   Checking Host Key: false
aws_instance.Project1-Ec2-Instance (remote-exec):   Target Platform: unix
aws_instance.Project1-Ec2-Instance (remote-exec): Connected!
aws_instance.Project1-Ec2-Instance: Still creating... [40s elapsed]
aws_instance.Project1-Ec2-Instance (remote-exec): Completed 13 Bytes/13 Bytes (92 Bytes/s) with 1 file(s) remaining
aws_instance.Project1-Ec2-Instance (remote-exec): upload: ./hello.txt to s3://terraform1-project1-tf-s3bucket/hello.txt
aws_instance.Project1-Ec2-Instance (remote-exec): Completed 13 Bytes/13 Bytes (95 Bytes/s) with 1 file(s) remaining
aws_instance.Project1-Ec2-Instance (remote-exec): download: s3://terraform1-project1-tf-s3bucket/hello.txt to ./download_hello.txt
aws_instance.Project1-Ec2-Instance (remote-exec): Hello, World
aws_instance.Project1-Ec2-Instance: Creation complete after 46s [id=i-0dc07f28535096ab1]

Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

Outputs:

Created_bucketName = "terraform1-project1-tf-s3bucket"
siddharthlucky@Siddharths-MacBook-Pro Project 1 %