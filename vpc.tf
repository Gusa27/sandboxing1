// AWS VPC 
resource "aws_vpc" "fgtvm-vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name = "vpc-sandboxing1"
  }
}

resource "aws_subnet" "publicsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.publiccidraz1
  availability_zone = var.az1
  tags = {
    Name = "public subnet az1"
  }
}

resource "aws_subnet" "privatesubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.privatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "private subnet az1"
  }
}

resource "aws_subnet" "bastionsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.bastioncidraz1
  availability_zone = var.az1
  tags = {
    Name = "bastion subnet az1"
  }
}

resource "aws_subnet" "pcsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.pccidraz1
  availability_zone = var.az1
  tags = {
    Name = "pc subnet az1"
  }
}

resource "aws_subnet" "dcsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.dccidraz1
  availability_zone = var.az1
  tags = {
    Name = "dc subnet az1"
  }
}