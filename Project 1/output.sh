siddharthlucky@Siddharths-MacBook-Pro Project 1 % terraform apply -var-file="users/user1.tfvars"
aws_vpc.Project1-VPC: Refreshing state... [id=vpc-037ef7538407e01d0]
aws_iam_role.Project1-EC2-Role-S3: Refreshing state... [id=Terraform1-ec2-role]
aws_s3_bucket.Project1-S3Bucket: Refreshing state... [id=terraform1-project1-tf-s3bucket]
aws_iam_role_policy_attachment.Project1-EC2-S3-RolePolicy: Refreshing state... [id=Terraform1-ec2-role-20240603103850440300000001]
aws_iam_instance_profile.Project1-EC2-S3-InstanceProfile: Refreshing state... [id=ec2_instance_profile]
aws_internet_gateway.Project1-Gateway: Refreshing state... [id=igw-08c0298d3ff74b5f6]
aws_subnet.Project1-Subnet: Refreshing state... [id=subnet-0966a293ad1916eb5]
aws_security_group.Project1-SecurityGroup: Refreshing state... [id=sg-0f427ee09a0502c13]
aws_s3_bucket_policy.Project1-S3-BucketPolicy: Refreshing state... [id=terraform1-project1-tf-s3bucket]
aws_s3_bucket_lifecycle_configuration.Project1-Bucket-Config: Refreshing state... [id=terraform1-project1-tf-s3bucket]
aws_route_table.Project1-RouteTable: Refreshing state... [id=rtb-03b7d6fbde827fbcf]
aws_instance.Project1-Ec2-Instance: Refreshing state... [id=i-0dea272912504e50e]
aws_route_table_association.Project1-RouteTable-Association: Refreshing state... [id=rtbassoc-085aa0a1f7e11095f]
aws_vpc_endpoint.Project1-VPC-Endpoint: Refreshing state... [id=vpce-04d2eb0d15750735d]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
-/+ destroy and then create replacement

Terraform will perform the following actions:

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
      + role        = "Terraform1-ec2-role"
    }

  # aws_instance.Project1-Ec2-Instance must be replaced
-/+ resource "aws_instance" "Project1-Ec2-Instance" {
      ~ arn                                  = "arn:aws:ec2:us-east-1:851725400912:instance/i-0dea272912504e50e" -> (known after apply)
      ~ cpu_core_count                       = 1 -> (known after apply)
      ~ cpu_threads_per_core                 = 1 -> (known after apply)
      ~ disable_api_stop                     = false -> (known after apply)
      ~ disable_api_termination              = false -> (known after apply)
      ~ ebs_optimized                        = false -> (known after apply)
      - hibernation                          = false -> null
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      ~ id                                   = "i-0dea272912504e50e" -> (known after apply)
      ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
      + instance_lifecycle                   = (known after apply)
      ~ instance_state                       = "running" -> (known after apply)
      ~ ipv6_address_count                   = 0 -> (known after apply)
      ~ ipv6_addresses                       = [] -> (known after apply)
      ~ monitoring                           = false -> (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      ~ placement_partition_number           = 0 -> (known after apply)
      ~ primary_network_interface_id         = "eni-07f436c9bf6895b26" -> (known after apply)
      ~ private_dns                          = "ip-10-0-1-87.ec2.internal" -> (known after apply)
      ~ private_ip                           = "10.0.1.87" -> (known after apply)
      + public_dns                           = (known after apply)
      ~ public_ip                            = "52.207.217.189" -> (known after apply)
      ~ secondary_private_ips                = [] -> (known after apply)
      ~ security_groups                      = [ # forces replacement
          + "sg-0f427ee09a0502c13",
        ]
      + spot_instance_request_id             = (known after apply)
        tags                                 = {
            "Name" = "Terraform1-Project1-EC2"
        }
      ~ tenancy                              = "default" -> (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      ~ vpc_security_group_ids               = [
          - "sg-0f427ee09a0502c13",
        ] -> (known after apply)
        # (11 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-026eb138e4307efe0" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

Plan: 2 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_role_policy.ec2_additional_permissions: Creating...
aws_instance.Project1-Ec2-Instance: Destroying... [id=i-0dea272912504e50e]
aws_iam_role_policy.ec2_additional_permissions: Creation complete after 2s [id=Terraform1-ec2-role:ec2_additional_permissions]
aws_instance.Project1-Ec2-Instance: Still destroying... [id=i-0dea272912504e50e, 10s elapsed]
aws_instance.Project1-Ec2-Instance: Still destroying... [id=i-0dea272912504e50e, 20s elapsed]
aws_instance.Project1-Ec2-Instance: Still destroying... [id=i-0dea272912504e50e, 30s elapsed]
aws_instance.Project1-Ec2-Instance: Still destroying... [id=i-0dea272912504e50e, 40s elapsed]
aws_instance.Project1-Ec2-Instance: Destruction complete after 43s
aws_instance.Project1-Ec2-Instance: Creating...
aws_instance.Project1-Ec2-Instance: Still creating... [10s elapsed]
aws_instance.Project1-Ec2-Instance: Still creating... [20s elapsed]
aws_instance.Project1-Ec2-Instance: Still creating... [30s elapsed]
aws_instance.Project1-Ec2-Instance: Creation complete after 36s [id=i-04e2455a2eda7842c]

Apply complete! Resources: 2 added, 0 changed, 1 destroyed.

Outputs:

Created_bucketName = "terraform1-project1-tf-s3bucket"
siddharthlucky@Siddharths-MacBook-Pro Project 1 % ssh -i "TF-new-Keypair.pem" ec2-user@3.81.51.57
The authenticity of host '3.81.51.57 (3.81.51.57)' can't be established.
ED25519 key fingerprint is SHA256:m84twlM0jOVDr1cJtn5yioPlaoO6lDC8DzuPE+MrDd0.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '3.81.51.57' (ED25519) to the list of known hosts.
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
[ec2-user@ip-10-0-1-151 ~]$ echo "Hello, World" > hello.txt
[ec2-user@ip-10-0-1-151 ~]$ aws s3 cp hello.txt s3://terraform1-project-tf-s3bucket/hello.txt
upload failed: ./hello.txt to s3://terraform1-project-tf-s3bucket/hello.txt An error occurred (NoSuchBucket) when calling the PutObject operation: The specified bucket does not exist
[ec2-user@ip-10-0-1-151 ~]$ aws s3 cp hello.txt s3://terraform1-project1-tf-s3bucket/hello.txt
upload: ./hello.txt to s3://terraform1-project1-tf-s3bucket/hello.txt
[ec2-user@ip-10-0-1-151 ~]$ aws s3 cp s3://terraform1-project1-tf-s3bucket/hello.txt downloaded_hello.txt
download: s3://terraform1-project1-tf-s3bucket/hello.txt to ./downloaded_hello.txt
[ec2-user@ip-10-0-1-151 ~]$ aws ec2 describe-vpcs --vpc-id vpc-037ef7538407e01d0
{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-0016503396d700054",
            "State": "available",
            "VpcId": "vpc-037ef7538407e01d0",
            "OwnerId": "851725400912",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0939dd658bd6b3bd4",
                    "CidrBlock": "10.0.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false,
            "Tags": [
                {
                    "Key": "Name",
[ec2-user@ip-10-0-1-151 ~]$ aws s3 ls s3:terraform1-project1-tf-s3bucket

Parameter validation failed:
Invalid bucket name "s3:terraform1-project1-tf-s3bucket": Bucket name must match the regex "^[a-zA-Z0-9.\-_]{1,255}$" or be an ARN matching the regex "^arn:(aws).*:(s3|s3-object-lambda):[a-z\-0-9]*:[0-9]{12}:accesspoint[/:][a-zA-Z0-9\-.]{1,63}$|^arn:(aws).*:s3-outposts:[a-z\-0-9]+:[0-9]{12}:outpost[/:][a-zA-Z0-9\-]{1,63}[/:]accesspoint[/:][a-zA-Z0-9\-]{1,63}$"
[ec2-user@ip-10-0-1-151 ~]$ aws s3 ls s3://terraform1-project1-tf-s3bucket
2024-06-03 11:01:20         13 hello.txt
[ec2-user@ip-10-0-1-151 ~]$ aws ec2 describe-instances --filters "Name=subnetid,Values=subnet-0966a293ad1916eb5"

An error occurred (InvalidParameterValue) when calling the DescribeInstances operation: The filter 'subnetid' is invalid
[ec2-user@ip-10-0-1-151 ~]$ aws ec2 describe-instances --filters "Name=subnet-id,Values=subnet-0966a293ad1916eb5"
{
    "Reservations": [
        {
            "Groups": [],
            "Instances": [
                {
                    "AmiLaunchIndex": 0,
                    "ImageId": "ami-00beae93a2d981137",
                    "InstanceId": "i-04e2455a2eda7842c",
                    "InstanceType": "t2.micro",
                    "KeyName": "TF-new-Keypair",
                    "LaunchTime": "2024-06-03T10:56:21+00:00",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "Placement": {
                        "AvailabilityZone": "us-east-1a",
                        "GroupName": "",
                        "Tenancy": "default"
                    },
                    "PrivateDnsName": "ip-10-0-1-151.ec2.internal",
                    "PrivateIpAddress": "10.0.1.151",
                    "ProductCodes": [],
                    "PublicDnsName": "",
                    "PublicIpAddress": "3.81.51.57",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "StateTransitionReason": "",
                    "SubnetId": "subnet-0966a293ad1916eb5",
                    "VpcId": "vpc-037ef7538407e01d0",
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/xvda",
                            "Ebs": {
                                "AttachTime": "2024-06-03T10:56:21+00:00",
                                "DeleteOnTermination": true,
                                "Status": "attached",
                                "VolumeId": "vol-0212e159e38b9207d"
                            }
                        }
                    ],
                    "ClientToken": "terraform-20240603105619989400000001",
                    "EbsOptimized": false,
                    "EnaSupport": true,
                    "Hypervisor": "xen",
                    "IamInstanceProfile": {
                        "Arn": "arn:aws:iam::851725400912:instance-profile/ec2_instance_profile",
                        "Id": "AIPA4MTWKHNIEVAZCCK63"
                    },
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "amazon",
                                "PublicDnsName": "",
                                "PublicIp": "3.81.51.57"
                            },
                            "Attachment": {
                                "AttachTime": "2024-06-03T10:56:21+00:00",
                                "AttachmentId": "eni-attach-0623ee7f4bd9320a9",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached",
                                "NetworkCardIndex": 0
                            },
                            "Description": "",
                            "Groups": [
                                {
                                    "GroupName": "private-sg",
                                    "GroupId": "sg-0f427ee09a0502c13"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "MacAddress": "0e:4b:e7:14:cd:4b",
                            "NetworkInterfaceId": "eni-00a2018001a674120",
                            "OwnerId": "851725400912",
                            "PrivateIpAddress": "10.0.1.151",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "amazon",
                                        "PublicDnsName": "",
                                        "PublicIp": "3.81.51.57"
                                    },
                                    "Primary": true,
                                    "PrivateIpAddress": "10.0.1.151"
                                }
                            ],
                            "SourceDestCheck": true,
                            "Status": "in-use",
                            "SubnetId": "subnet-0966a293ad1916eb5",
                            "VpcId": "vpc-037ef7538407e01d0",
                            "InterfaceType": "interface"
                        }
                    ],
                    "RootDeviceName": "/dev/xvda",
                    "RootDeviceType": "ebs",
                    "SecurityGroups": [
                        {
                            "GroupName": "private-sg",
                            "GroupId": "sg-0f427ee09a0502c13"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Tags": [
                        {
                            "Key": "Name",
                            "Value": "Terraform1-Project1-EC2"
                        }
                    ],
                    "VirtualizationType": "hvm",
                    "CpuOptions": {
                        "CoreCount": 1,
                        "ThreadsPerCore": 1
                    },
                    "CapacityReservationSpecification": {
                        "CapacityReservationPreference": "open"
                    },
                    "HibernationOptions": {
                        "Configured": false
                    },
                    "MetadataOptions": {
                        "State": "applied",
                        "HttpTokens": "required",
                        "HttpPutResponseHopLimit": 2,
                        "HttpEndpoint": "enabled",
                        "HttpProtocolIpv6": "disabled",
                        "HttpProtocolIpv6": "disabled",
                        "InstanceMetadataTags": "disabled"
                    },
                    "EnclaveOptions": {
                        "Enabled": false
                    },
                    "BootMode": "uefi-preferred",
                    "PlatformDetails": "Linux/UNIX",
                    "UsageOperation": "RunInstances",
                    "UsageOperationUpdateTime": "2024-06-03T10:56:21+00:00",
                    "PrivateDnsNameOptions": {
                        "HostnameType": "ip-name",
                        "EnableResourceNameDnsARecord": false,
                        "EnableResourceNameDnsAAAARecord": false
                    },
                    "MaintenanceOptions": {
                        "AutoRecovery": "default"
                    },
                    "CurrentInstanceBootMode": "legacy-bios"
                }
            ],
            "OwnerId": "851725400912",
            "ReservationId": "r-01614f068dcbdbae0"
        }
    ]
}
(END)
[1]+  Stopped                 aws ec2 describe-instances --filters "Name=subnet-id,Values=subnet-0966a293ad1916eb5"


--------------------------------------------------------

