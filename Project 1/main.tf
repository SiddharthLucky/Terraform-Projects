provider "aws" {
  region = "us-east-1"
}

//Creating VPC
resource "aws_vpc" "Project1-VPC" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "Project1-VPC"
  }
}

resource "aws_subnet" "Project1-Subnet" {
  vpc_id     = aws_vpc.Project1-VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Project1-Subnet"
  }
}

resource "aws_route_table" "Project1-RouteTable" {
  vpc_id = aws_vpc.Project1-VPC.id
}