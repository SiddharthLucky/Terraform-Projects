provider "aws" {
  region = "us-east-1"
}

//Creating VPC
resource "aws_vpc" "Project1-VPC" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "${var.user}-Project1-VPC"
  }
}

//Create Subnet
resource "aws_subnet" "Project1-Subnet" {
  vpc_id     = aws_vpc.Project1-VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.user}-Project1-Subnet"
  }
}

//Create Custom Route Table
resource "aws_route_table" "Project1-RouteTable" {
  vpc_id = aws_vpc.Project1-VPC.id

  route {
    //Points all traffic to the default route
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Project1-Gateway.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.Project1-Gateway.id
  }

  tags = {
    Name = "${var.user}-Project1-RouteTable"
  }
}

//Create route table association
resource "aws_route_table_association" "Project1-RouteTable-Association" {
  route_table_id = aws_route_table.Project1-RouteTable.id
  subnet_id = aws_subnet.Project1-Subnet.id
}

//Create an S3 VPC endpoint
resource "aws_vpc_endpoint" "Project1-VPC-Endpoint" {
  vpc_id = aws_vpc.Project1-VPC.id
  service_name = "com.amazonaws.us-east-1.s3"
  route_table_ids = [aws_route_table.Project1-RouteTable.id]
  tags = {
    Name = "${var.user}-Project1-S3-VPC"
  }
}

//Create an S3 Bucket
resource "aws_s3_bucket" "Project1-S3Bucket" {
  //bucket = ""+lower(var.user)+""
  bucket = join("", [lower(var.user),lower("-project1-TF-S3Bucket")])
  //service_name      = "com.amazonaws.us-east1a.s3"
  //route_table_ids   = [aws_route_table.Project1-RouteTable.id]
  tags = {
    Name = join("", [lower(var.user),lower("-project1-TF-S3Bucket")])
  }
}

//Checking the name of the bucket
output "Created_bucketName" {
  value = aws_s3_bucket.Project1-S3Bucket.tags.Name
}

# //Create S3 Bucket acl
# resource "aws_s3_bucket_acl" "bucket_acl" {
# bucket = aws_s3_bucket.Project1-S3Bucket.id
# acl    = "private"
# }

//Create S3 bucket lifecycle
resource "aws_s3_bucket_lifecycle_configuration" "Project1-Bucket-Config" {
  bucket = aws_s3_bucket.Project1-S3Bucket.id
  rule {
    id     = "log"
    status = "Enabled"
    transition {
      storage_class = "GLACIER"
      days = "30"
    }
  }
}

//Creating S3 bucket policy
resource "aws_s3_bucket_policy" "Project1-S3-BucketPolicy" {
  bucket = aws_s3_bucket.Project1-S3Bucket.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:*",
        "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.Project1-S3Bucket.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.Project1-S3Bucket.bucket}/*"
        ],
        "Condition": {
          "StringEquals": {
            "aws:sourceVpc": aws_vpc.Project1-VPC.id
          }
        }
      }
    ]
  })
}

//Create Security group to allow port 22, 80, 443
resource "aws_security_group" "Project1-SecurityGroup" {
  name        = "private-sg"
  description = "Private SG"
  vpc_id      = aws_vpc.Project1-VPC.id
  tags = {
    Name = "Project1-SecurityGroup"
  }

  ingress {
    from_port = 443
    to_port = 443
    description = "HTTPS"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    description = "HTTP"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    description = "SSH"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    //Any protocol will be allowed
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//Create Internet Gateway
resource "aws_internet_gateway" "Project1-Gateway" {
  vpc_id = aws_vpc.Project1-VPC.id
  tags = {
    Name = "${var.user}-Project1-Gateway"
  }
}

//Create an Ec2 Instance
resource "aws_instance" "Project1-Ec2-Instance" {
  ami = "ami-00beae93a2d981137"
  availability_zone = "us-east-1a"
  instance_type = "t2.micro"
  key_name = "TF-new-Keypair"
  subnet_id = aws_subnet.Project1-Subnet.id
  security_groups = [aws_security_group.Project1-SecurityGroup.id]
  iam_instance_profile = aws_iam_instance_profile.Project1-EC2-S3-InstanceProfile.name
  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, World' > hello.txt",
      "aws s3 cp hello.txt s3://terraform1-project1-tf-s3bucket",
      "aws s3 cp s3://terraform1-project1-tf-s3bucket/hello.txt download_hello.txt",
      "cat download_hello.txt"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/TF-new-Keypair.pem")
    host        = self.public_ip
  }

  tags = {
    Name = "${var.user}-Project1-EC2"
  }
}

# resource "aws_instance" "Project1-Ec2-Instance2" {
#   ami = "ami-00beae93a2d981137"
#   availability_zone = "us-east-1a"
#   instance_type = "t2.micro"
#   key_name = "TF-new-Keypair"
#   subnet_id = aws_subnet.Project1-Subnet.id
#   security_groups = [aws_security_group.Project1-SecurityGroup.id]
#   //iam_instance_profile = aws_iam_instance_profile.Project1-EC2-S3-InstanceProfile.name
#
#   associate_public_ip_address = true
#   tags = {
#     Name = "Terraform2-Project1-EC2"
#   }
# }

//Create IAM role
resource "aws_iam_role" "Project1-EC2-Role-S3" {
  name = "${var.user}-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

//Assign role policy to IAM
resource "aws_iam_role_policy_attachment" "Project1-EC2-S3-RolePolicy" {
  role       = aws_iam_role.Project1-EC2-Role-S3.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

//Adding Additional role policies to created IAM
resource "aws_iam_role_policy" "ec2_additional_permissions" {
  name   = "ec2_additional_permissions"
  role   = aws_iam_role.Project1-EC2-Role-S3.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:DescribeVpcs",
          "ec2:DescribeInstances"
        ],
        Resource = "*"
      }
    ]
  })
}

//Create IAM role Instance profile
resource "aws_iam_instance_profile" "Project1-EC2-S3-InstanceProfile" {
  name = "${var.user}-ec2_instance_profile"
  role = aws_iam_role.Project1-EC2-Role-S3.id
}

